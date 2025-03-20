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
  final CartModel cart;
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

final class ChangeIndexState extends CartState {
  final int index;
  @override
  List<Object> get props => [index];
  const ChangeIndexState(this.index);
}

final class ChangeItemCounterState extends CartState {
  const ChangeItemCounterState();
}

final class ChangeQuantityAndPriceCounterState extends CartState {
  final int totalQuantity;
  @override
  List<Object> get props => [totalQuantity];
  const ChangeQuantityAndPriceCounterState(this.totalQuantity);
}

final class ChangeSessionStatusState extends CartState {
  final String status;
  @override
  List<Object> get props => [status];
  const ChangeSessionStatusState(this.status);
}

final class ChangeSessionState extends CartState {
  final TabbySession session;
  @override
  List<Object> get props => [session];
  const ChangeSessionState(this.session);
}

final class DeleteItemFromCartFailureState extends CartState {
  final String message;
  const DeleteItemFromCartFailureState(this.message);
}

final class DeleteItemFromCartSuccessState extends CartState {
  final String message;
  const DeleteItemFromCartSuccessState(this.message);
}
