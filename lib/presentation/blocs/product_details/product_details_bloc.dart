import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/usecases/get_product_details.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetails getProductDetails;

  ProductDetailsBloc({required this.getProductDetails})
      : super(ProductDetailsInitial()) {
    on<ProductDataLoadEvent>((event, emit) async {
      final Either<AppError, ProductDetailsEntity> eitherReponse =
          await getProductDetails(ProductParams(id: event.productId));
      eitherReponse.fold(
        (l) => emit(ProductDetailsError()),
        (r) => emit(
            ProductDetailsLoaded(productDetail: r, productId: event.productId)),
      );
    });
  }
}
