part of 'shopping_backdrop_bloc.dart';

abstract class ShoppingBackdropEvent extends Equatable {
  const ShoppingBackdropEvent();

  @override
  List<Object> get props => [];
}

class ShoppingBackdropChangedEvent extends ShoppingBackdropEvent {
  final MenuEntity menu;

  const ShoppingBackdropChangedEvent({required this.menu});

  @override
  List<Object> get props => [menu];
}
