part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeCubitInitial extends HomeState {}

final class ChangeIndexState extends HomeState {
  final int index;

  const ChangeIndexState(this.index);

  @override
  List<Object> get props => [index];
}

final class HomeLoadingState extends HomeState {}

final class GetCategorySuccessState extends HomeState {
  final List<CategoryModel> category;

  const GetCategorySuccessState(this.category);

  @override
  List<Object> get props => [category];
}

final class GetCategoryFailureState extends HomeState {}

final class GetBannersSuccessState extends HomeState {
  final List<BannersModel> banners;

  const GetBannersSuccessState(this.banners);

  @override
  List<Object> get props => [banners];
}

final class GetBannersFailureState extends HomeState {}

final class FavoriteFailureState extends HomeState {}

final class FavoriteSuccessState extends HomeState {
  final Set<String> favoriteList;

  const FavoriteSuccessState(this.favoriteList);
}

final class HomeSucssessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String message;

  const HomeFailureState(this.message);
}
