import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/cart/domin/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(CartInitial());

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
}
