import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetFavoriteProducts extends UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository _productRepository;

  GetFavoriteProducts(this._productRepository);

  @override
  Future<Either<AppError, List<ProductEntity>>> call(NoParams params) async {
    return await _productRepository.getFavoriteProducts();
  }
}
