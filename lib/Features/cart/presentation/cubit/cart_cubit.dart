import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/cart/domin/repo/cart_repo.dart';
import 'package:two_be/core/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/service/my_fatoorah.dart';
import '../../data/model/cart_model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(CartInitial());

  List<CartModel> cart = [];

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

  Future<void> createOrder() async {
    emit(CreateOrderLoadingState());

    //! Step 1: Create the order
    final result = await _repo.createOrder();
    result.fold(
      (failure) {
        emit(CreateOrderFailureState(failure.message));
      },
      (order) async {
        //! Step 2: Initialize MyFatoorah service
        final myFatoorah = MyFatoorahService(
          apiKey: ftoorhApiKey,
          isTest: true,
        );

        try {
          //! Step 3: Initiate payment
          final paymentInitResponse = await myFatoorah.initiatePayment(
            double.parse(order.total ?? ""),
            'SAR',
          );

          //! Step 4: Execute payment
          final paymentMethodId =
              paymentInitResponse['PaymentMethods'][0]['PaymentMethodId'];
          final paymentExecuteResponse = await myFatoorah.executePayment(
            paymentMethodId,
            double.parse(order.total ?? ""),
          );

          //! Step 5: Get payment URL and redirect user
          final paymentUrl = paymentExecuteResponse['PaymentURL'];
          if (paymentUrl != null) {
            await launchUrl(Uri.parse(paymentUrl));
          } else {
            throw Exception('Payment URL not found');
          }

          //! Step 6: Check payment status
          final paymentId = paymentExecuteResponse['PaymentId'];
          final paymentStatusResponse =
              await myFatoorah.checkPaymentStatus(paymentId);

          if (paymentStatusResponse['IsSuccess'] == true) {
            //await _repo.updateOrderStatus(order.id, 'Paid'); // Update order status
            emit(PaymentSuccessState());
          } else {
            emit(PaymentFailureState(
                paymentStatusResponse['Message'] ?? 'Payment failed'));
          }
        } catch (e) {
          emit(CreateOrderFailureState(e.toString()));
        }
      },
    );
  }
}
