import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class SaveProduct extends UseCase<void, ProductEntity> {
  final ProductRepository _productRepository;

  SaveProduct(this._productRepository);
  @override
  Future<Either<AppError, void>> call(ProductEntity params) async {
    return await _productRepository.saveFavoriteProduct(params);
  }
}
