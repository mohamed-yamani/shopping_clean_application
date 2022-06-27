import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/usecases/check_if_product_favorite.dart';
import 'package:petshop/domain/usecases/delete_favorite_products.dart';
import 'package:petshop/domain/usecases/get_favorite_products.dart';
import 'package:petshop/domain/usecases/save_product.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveProduct saveProduct;
  final GetFavoriteProducts getFavoriteProducts;
  final DeleteFavoriteProduct deleteFavoriteProduct;
  final CheckIfProductFavorite checkIfProductFavorite;

  FavoriteBloc(
      {required this.saveProduct,
      required this.getFavoriteProducts,
      required this.deleteFavoriteProduct,
      required this.checkIfProductFavorite})
      : super(FavoriteInitial()) {
    on<ToggleFavoriteProductEvent>((event, emit) async {
      if (event.isFavorite) {
        await deleteFavoriteProduct(
          ProductParams(id: event.product.id),
        );
      } else {
        await saveProduct(event.product);
      }
      final response = await checkIfProductFavorite(
        ProductParams(id: event.product.id),
      );
      emit(
        response.fold(
          (l) => FavoriteProductErrorState(),
          (r) => IsFavoriteProductState(r),
        ),
      );
    });
    on<LoadFavoriteProductEvent>((event, emit) async {
      final Either<AppError, List<ProductEntity>> result =
          await getFavoriteProducts(NoParams());
        
      emit(result.fold((l) => FavoriteProductErrorState(),
          (r) => FavoriteProductsLoadedState(r)));
    });
    on<CheckIfProductFavoriteEvent>((event, emit) async {
      final Either<AppError, bool> result =
          await checkIfProductFavorite(ProductParams(id: event.productId));
      emit(result.fold((l) => FavoriteProductErrorState(),
          (r) => IsFavoriteProductState(r)));
    });
    on<DeleteFavoriteProductEvent>((event, emit) async {
      await deleteFavoriteProduct(ProductParams(id: event.productId));
      add(LoadFavoriteProductEvent());
    });
  }
}
