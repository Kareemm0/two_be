import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:two_be/Features/cart/data/model/order/order_model/order_model.dart';
import 'package:two_be/Features/cart/domin/repo/cart_repo.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/service/tabby.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import '../../data/model/cart_model/cart_model.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(CartInitial());

  CartModel? cart;

  List<String> payImages = [
    AppImages.fatora,
    AppImages.ta,
    AppImages.ca,
  ];

  int currentIndex = 0;
  int itemCounter = 1;
  String status = 'idle';
  String merchantCode = 'ae';
  TabbySession? session;
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  int totalQuantity = 0;
  double totalPrice = 0.0;

//!=============== MyFatoorah ===============!//
  void setUpActionBar() {
    MFSDK.setUpActionBar(
      toolBarTitle: 'TwoBe',
      toolBarTitleColor: AppColors.secondaryColor.toString(),
      toolBarBackgroundColor: AppColors.primaryColor.toString(),
      isShowToolBar: true,
    );
  }

  Future<void> sendPayment(
    OrderModel order, {
    required String customerName,
    required String customerEmail,
    required String amount,
  }) async {
    try {
      MFSendPaymentRequest request = MFSendPaymentRequest();
      request.customerName = customerName;
      request.invoiceValue = double.parse(amount);
      request.notificationOption = MFNotificationOption.EMAIL;
      request.customerEmail = customerEmail;

      await MFSDK.sendPayment(request, MFLanguage.ENGLISH).then((value) {
        log(value.toString());
        emit(CreateOrderSuccessState());
      }).catchError((error) {
        log(error.message);
        emit(CreateOrderFailureState("Payment failed: ${error.message}"));
      });
    } catch (e) {
      emit(CreateOrderFailureState("Error: ${e.toString()}"));
    }
  }

  Future<void> initiateAndExecutePayment(OrderModel order,
      {required String amount}) async {
    try {
      MFInitiatePaymentRequest initiateRequest = MFInitiatePaymentRequest(
        invoiceAmount: double.parse(amount),
        currencyIso: MFCurrencyISO.KUWAIT_KWD,
      );

      final paymentMethods = await MFSDK.initiatePayment(
        initiateRequest,
        MFLanguage.ENGLISH,
      );

      int paymentMethodId = 2;

      MFExecutePaymentRequest executeRequest =
          MFExecutePaymentRequest(invoiceValue: double.parse(amount));
      executeRequest.paymentMethodId = paymentMethodId;

      await MFSDK.executePayment(
        executeRequest,
        MFLanguage.ENGLISH,
        (invoiceId) {
          // Payment successful
          log("Payment successful. Invoice ID: $invoiceId");
          emit(CreateOrderSuccessState());
        },
      ).then((value) {
        log(value.toString());
      }).catchError((error) {
        log(error.message);
        emit(CreateOrderFailureState("Payment failed: ${error.message}"));
      });
    } catch (e) {
      emit(CreateOrderFailureState("Error: ${e.toString()}"));
    }
  }

//! =================== add to cart ===================!//
  Future<void> addToCart({required String productId, int quantity = 1}) async {
    emit(AddToCartLoadingState());
    final result = await _repo.addToCart(
      productId: productId,
      quantity: quantity,
    );
    result.fold(
      (l) => emit(AddToCartFailureState(l.message)),
      (r) => emit(AddToCartSuccessState(r)),
    );
  }

  //! =================== get cart ===================!//
  Future<void> getCart() async {
    emit(AddToCartLoadingState());
    final result = await _repo.getCart();
    result.fold(
      (l) => emit(GetCartFailureState(l.message)),
      (r) {
        cart = r;
        calculateTotalQuantityAndPrice();
        emit(GetCartSuccessState(r));
      },
    );
  }

  //! =================== create order ===================//!

  Future<void> createOrder(
    BuildContext context, {
    required String customerName,
    required String customerEmail,
    required String address,
    required String phone,
    required String amount,
    required String tabbyAmount,
    String? country,
  }) async {
    log("Cart items before mapping: ${cart?.items?.map((item) => item.quantity).toList()}");

    // Retrieve saved quantities from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < (cart?.items?.length ?? 0); i++) {
      final savedQuantity = prefs.getInt('item_quantity_$i');
      if (savedQuantity != null) {
        cart!.items![i].quantity = savedQuantity;
      }
    }

    List<Map<String, dynamic>> lineItems = (cart?.items ?? []).map((product) {
      log("Processing product_id: ${product.id}, quantity: ${product.quantity}");

      return {
        "product_id": product.id ?? 0,
        "quantity": product.quantity ?? 0,
      };
    }).toList();

    log("Final Line items being sent: $lineItems");

    emit(CreateOrderLoadingState());

    final result = await _repo.createOrder(
      address: country,
      city: cityController.text,
      customerEmail: customerEmail,
      customerName: customerName,
      customerPhone: phone,
      paymentMehthod: currentIndex == 0
          ? "MyFatoorah"
          : currentIndex == 1
              ? "Tabby"
              : "Cash on Delivery",
      state: stateController.text,
      lineItems: lineItems,
    );

    result.fold(
      (failure) {
        emit(CreateOrderFailureState(failure.message));
      },
      (order) async {
        if (currentIndex == 0) {
          setUpActionBar();
          try {
            await sendPayment(
              order,
              customerName: customerName,
              customerEmail: customerEmail,
              amount: amount,
            );
            await initiateAndExecutePayment(
              order,
              amount: double.parse(amount).toString(),
            );
          } catch (e) {
            emit(CreateOrderFailureState("Error: ${e.toString()}"));
          }
        } else if (currentIndex == 1) {
          try {
            await createSession(
              context,
              address: address,
              email: customerEmail,
              name: customerEmail,
              phone: phone,
              amount: tabbyAmount,
            );
          } catch (e) {
            emit(CreateOrderFailureState("Error: ${e.toString()}"));
          }
        }
        emit(CreateOrderSuccessState());
      },
    );
  }

  //! =================== change Ui States ===================//!
  void changeIndex(int index) {
    currentIndex = index;
    log(index.toString());
    emit(ChangeIndexState(index));
  }

  void updateItemQuantity(int index, int newQuantity) async {
    if (cart?.items != null && index < cart!.items!.length) {
      if (newQuantity < 1) {
        log("Quantity cannot be less than 1. Setting to 1.");
        newQuantity = 1;
      }

      log("Updating item at index $index from ${cart!.items![index].quantity} to $newQuantity");
      cart!.items![index].quantity = newQuantity;

      log("Updated cart items: ${cart!.items!.map((item) => item.quantity).toList()}");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('item_quantity_$index', newQuantity);

      calculateTotalQuantityAndPrice();
      emit(ChangeItemCounterState());
    }
  }

  void calculateTotalQuantityAndPrice() {
    totalQuantity = 0;
    totalPrice = 0.0;

    if (cart?.items != null) {
      for (var item in cart!.items!) {
        totalQuantity += item.quantity ?? 0;
        totalPrice += (double.tryParse(item.prices?.price ?? "0") ?? 0) *
            (item.quantity ?? 0);
      }
      log("Total Quantity: $totalQuantity, Total Price: $totalPrice");
      emit(ChangeQuantityAndPriceCounterState(totalQuantity));
    }
  }

  //! =================== Tabby ===================//!

  void _setStatus(String newStatus) {
    status = newStatus;
    emit(ChangeSessionStatusState(status));
  }

  Future<void> createSession(
    BuildContext context, {
    required String address,
    required String email,
    required String phone,
    required String name,
    required String amount,
  }) async {
    try {
      _setStatus('pending');
      log("Creating Tabby session with amount: $amount");

      final s = await TabbySDK().createSession(TabbyCheckoutPayload(
        merchantCode: merchantCode,
        lang: Lang.ar,
        payment: createMockPayload(
          address: address,
          city: cityController.text,
          ordertitle: cart?.items?[0].name ?? "",
          quantity: cart?.items?[0].quantity ?? 1,
          amount: amount, // Use the passed amount
          currency: Currency.sar,
          email: email,
          phone: phone,
          name: name,
        ),
      ));

      log('Session id: ${s.sessionId}');

      session = s;
      emit(ChangeSessionState(session!));

      _setStatus('created');
      openCheckOutPage(context);
    } catch (e, s) {
      log("error: $e, $s");
      _setStatus('error');
    }
  }

  void openCheckOutPage(BuildContext context) {
    if (session == null) {
      showToast(message: 'Session not available');
      return;
    }

    if (session!.status == SessionStatus.rejected) {
      final rejectionText = TabbySDK.rejectionTextAr;
      showToast(message: rejectionText);
      return;
    }

    if (session!.availableProducts.installments == null) {
      showToast(message: 'Session has no products');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TabbyWebView(
          webUrl: session!.availableProducts.installments!.webUrl,
          onResult: (WebViewResult resultCode) {
            log("Tabby WebView Result: ${resultCode.name}");

            switch (resultCode) {
              case WebViewResult.authorized:
                break;
              case WebViewResult.close:
                break;
              case WebViewResult.expired:
                break;
              case WebViewResult.rejected:
                break;
            }
          },
        ),
      ),
    );
  }

  //! =================== Delete Item From Cart ===================//!
  Future<void> deleteItemFromCart({required String productKey}) async {
    final result = await _repo.deleteItemFromCart(productKey: productKey);
    result.fold(
      (l) => emit(DeleteItemFromCartFailureState(l.message)),
      (r) {
        emit(DeleteItemFromCartSuccessState(r));
      },
    );
  }
}
