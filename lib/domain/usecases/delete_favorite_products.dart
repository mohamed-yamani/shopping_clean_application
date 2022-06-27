import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class DeleteFavoriteProduct extends UseCase<void, ProductParams> {
  final ProductRepository _productRepository;

  DeleteFavoriteProduct(this._productRepository);

  @override
  Future<Either<AppError, void>> call(ProductParams params) async {
    return await _productRepository.deleteFavoriteProduct(params.id);
  }
}
