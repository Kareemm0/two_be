import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/cart/domin/repo/cart_repo.dart';
import 'package:two_be/core/constant/constant.dart';
import '../../../../core/service/my_fatoorah.dart';
import '../../data/model/cart_model/cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(CartInitial());

  CartModel? cart;

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
          isTest: false,
        );

        try {
          //! Step 3: Initiate payment
          final paymentInitResponse = await myFatoorah.initiatePayment(
            double.parse(order.total ?? ""),
            'SAR',
          );
          log('Payment Init Response: $paymentInitResponse');
          emit(PaymentSuccessState());
        } catch (e) {
          log("Error: ${e.toString()}");
          emit(CreateOrderFailureState(e.toString()));
        }
      },
    );
  }
}
