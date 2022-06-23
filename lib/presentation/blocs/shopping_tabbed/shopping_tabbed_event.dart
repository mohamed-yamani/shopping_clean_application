part of 'shopping_tabbed_bloc.dart';

abstract class ShoppingTabbedEvent extends Equatable {
  const ShoppingTabbedEvent();

  @override
  List<Object> get props => [];
}

class ShoppingTabbedChangedEvent extends ShoppingTabbedEvent {
  final int currentTabIndex;

  const ShoppingTabbedChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}
