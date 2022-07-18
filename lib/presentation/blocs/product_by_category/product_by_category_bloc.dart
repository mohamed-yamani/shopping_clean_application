import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_by_category_params.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/entites/producte_result_entity.dart';
import 'package:petshop/domain/usecases/get_product_by_category.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  final GetProductByCategory getProductByCategory;
  final LoadingCubit loadingCubit;

  ProductByCategoryBloc(
      {required this.getProductByCategory, required this.loadingCubit})
      : super(ProductByCategoryInitialState()) {
    on<ProductByCategoryLoadEvent>((event, emit) async {
      loadingCubit.show();
      final Either<AppError, ProductResultEntity> eitherReponse =
          await getProductByCategory(
              ProductByCategoryParams(id: event.categoryId, page: event.page));
      if (event.page == 1) {
        emit(ProductByCategoryInitialState());
        eitherReponse.fold(
            (l) => emit(ProductByCategoryErrorState()),
            (r) => emit(ProductByCategoryLoadedState(
                productResult: r, categoryId: event.categoryId)));
      } else {
        eitherReponse.fold(
            (l) => emit(ProductByCategoryErrorState()),
            (r) => emit(ProductByCategoryLoadedState(
                productResult: ProductResultEntity(
                    next: r.next,
                    previous: r.previous,
                    count: r.count,
                    products: [
                      ...(state as ProductByCategoryLoadedState)
                          .productResult
                          .products!,
                      ...r.products!
                    ]),
                categoryId: event.categoryId)));
      }
      loadingCubit.hide();
    });
  }
}
