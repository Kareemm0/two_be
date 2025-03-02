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
