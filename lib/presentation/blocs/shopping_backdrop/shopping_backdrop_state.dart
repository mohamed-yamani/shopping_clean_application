part of 'shopping_backdrop_bloc.dart';

abstract class ShoppingBackdropState extends Equatable {
  const ShoppingBackdropState();

  @override
  List<Object> get props => [];
}

class ShoppingBackdropInitialState extends ShoppingBackdropState {}

class ShoppingBackdropChangedState extends ShoppingBackdropState {
  final MenuEntity menu;

  const ShoppingBackdropChangedState({required this.menu});

  @override
  List<Object> get props => [menu];
}
