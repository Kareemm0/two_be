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
