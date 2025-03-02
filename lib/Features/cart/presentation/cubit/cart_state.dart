part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class AddToCartLoadingState extends CartState {}

final class AddToCartSuccessState extends CartState {
  final String message;
  const AddToCartSuccessState(this.message);
}

final class AddToCartFailureState extends CartState {
  final String message;
  const AddToCartFailureState(this.message);
}

final class GetCartFailureState extends CartState {
  final String message;
  const GetCartFailureState(this.message);
}

final class GetCartSuccessState extends CartState {
  final List<CartModel> cart;
  const GetCartSuccessState(this.cart);
}

final class CreateOrderLoadingState extends CartState {}

final class CreateOrderSuccessState extends CartState {}

final class CreateOrderFailureState extends CartState {
  final String message;
  const CreateOrderFailureState(this.message);
}

final class PaymentSuccessState extends CartState {}

final class PaymentFailureState extends CartState {
  final Map<String, dynamic> paymentStatusResponse;

  const PaymentFailureState(this.paymentStatusResponse);
}
