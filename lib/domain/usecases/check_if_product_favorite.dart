import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class CheckIfProductFavorite extends UseCase<bool, ProductParams> {
  final ProductRepository _productRepository;

  CheckIfProductFavorite(this._productRepository);

  @override
  Future<Either<AppError, bool>> call(ProductParams params) async {
    return await _productRepository.checkIfProductFavorite(params.id);
  }
}
