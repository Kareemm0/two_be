import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/cart/data/model/order/order_model/order_model.dart';
import 'package:two_be/Features/cart/domin/repo/cart_repo.dart';
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
    AppImages.myFat,
    AppImages.tabby,
    AppImages.cach,
  ];

  int currentIndex = 0;

  void setUpActionBar() {
    MFSDK.setUpActionBar(
      toolBarTitle: 'TwoBe',
      toolBarTitleColor: AppColors.secondaryColor.toString(),
      toolBarBackgroundColor: AppColors.primaryColor.toString(),
      isShowToolBar: true,
    );
  }

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

  Future<void> getCart() async {
    emit(AddToCartLoadingState());
    final result = await _repo.getCart();
    result.fold(
      (l) => emit(GetCartFailureState(l.message)),
      (r) {
        cart = r;
        emit(GetCartSuccessState(r));
      },
    );
  }

  Future<void> createOrder(BuildContext context,
      {required String customerName, required String customerEmail}) async {
    emit(CreateOrderLoadingState());

    final result = await _repo.createOrder();
    result.fold(
      (failure) {
        emit(CreateOrderFailureState(failure.message));
      },
      (order) async {
        setUpActionBar();
        try {
          await sendPayment(
            order,
            customerName: customerName,
            customerEmail: customerEmail,
          );
          await initiateAndExecutePayment(order);
        } catch (e) {
          emit(CreateOrderFailureState("Error: ${e.toString()}"));
        }
      },
    );
  }

  Future<void> sendPayment(
    OrderModel order, {
    required String customerName,
    required String customerEmail,
  }) async {
    try {
      MFSendPaymentRequest request = MFSendPaymentRequest();
      request.customerName = customerName;
      request.invoiceValue = 50;
      // order.totalAmount;
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

  Future<void> initiateAndExecutePayment(OrderModel order) async {
    try {
      MFInitiatePaymentRequest initiateRequest = MFInitiatePaymentRequest(
        invoiceAmount: 50, // order.totalAmount,
        currencyIso: MFCurrencyISO.KUWAIT_KWD,
      );

      final paymentMethods = await MFSDK.initiatePayment(
        initiateRequest,
        MFLanguage.ENGLISH,
      );

      int paymentMethodId = 2;

      MFExecutePaymentRequest executeRequest =
          MFExecutePaymentRequest(invoiceValue: 50
              // order.totalAmount,
              );
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

  void changeIndex(int index) {
    currentIndex = index;
    log(index.toString());
    emit(ChangeIndexState(index));
  }
}
