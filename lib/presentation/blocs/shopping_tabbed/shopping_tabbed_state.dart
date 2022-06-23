part of 'shopping_tabbed_bloc.dart';

abstract class ShoppingTabbedState extends Equatable {
  final int currentTabIndex;
  const ShoppingTabbedState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class ShoppingTabbedInitial extends ShoppingTabbedState {
  const ShoppingTabbedInitial({required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}

class ShoppingTabbedChangedState extends ShoppingTabbedState {
  final List<ProductEntity> productList;
  const ShoppingTabbedChangedState(
      {required this.productList, required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [productList, currentTabIndex];
}

class ShoppingTabbedErrorState extends ShoppingTabbedState {
  final AppErrorType appErrorType;
  const ShoppingTabbedErrorState(
      {required this.appErrorType, required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
