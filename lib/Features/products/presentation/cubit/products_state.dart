import 'package:equatable/equatable.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitalState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProcuctsSuccessState extends ProductsState {
  final List<ProductsModel> products;
  const ProcuctsSuccessState(this.products);
  @override
  List<Object> get props => [products];
}

final class ProductsFailureState extends ProductsState {
  final String message;
  const ProductsFailureState(this.message);
  @override
  List<Object> get props => [message];
}
