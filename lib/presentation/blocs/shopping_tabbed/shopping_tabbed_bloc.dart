import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/usecases/get_new_products.dart';
import 'package:petshop/domain/usecases/get_popular_products.dart';
import 'package:petshop/domain/usecases/get_promotion_products.dart';

part 'shopping_tabbed_event.dart';
part 'shopping_tabbed_state.dart';

class ShoppingTabbedBloc
    extends Bloc<ShoppingTabbedEvent, ShoppingTabbedState> {
  // ProductModel
  final GetNewProducts getNewProducts;
  final GetPromotionProducts getPromotionProducts;
  final GetPopularProducts getPopularProducts;

  ShoppingTabbedBloc(
      {required this.getNewProducts,
      required this.getPromotionProducts,
      required this.getPopularProducts})
      : super(const ShoppingTabbedInitial(currentTabIndex: 0)) {
    on<ShoppingTabbedChangedEvent>((event, emit) async {
      late Either<AppError, List<ProductEntity>> productEither;
      print('ShoppingTabbedBloc: ShoppingTabbedChangedEvent' +
          event.currentTabIndex.toString());
      switch (event.currentTabIndex) {
        case 0:
          productEither = await getNewProducts(NoParams());
          break;
        case 1:
          productEither = await getPromotionProducts(NoParams());
          break;
        case 2:
          productEither = await getPopularProducts(NoParams());
          break;
      }
      productEither.fold(
        (l) => emit(ShoppingTabbedErrorState(
            appErrorType: l.appErrorType,
            currentTabIndex: event.currentTabIndex)),
        (r) => emit(
          ShoppingTabbedChangedState(
              productList: r, currentTabIndex: event.currentTabIndex),
        ),
      );
    });
  }
}
