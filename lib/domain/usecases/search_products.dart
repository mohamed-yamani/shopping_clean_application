import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/entites/product_serach_params.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class SearchProducts extends UseCase<List<ProductEntity>, ProductSearchParams> {
  final ProductRepository _productRepository;

  SearchProducts(this._productRepository);

  @override
  Future<Either<AppError, List<ProductEntity>>> call(
      ProductSearchParams searchParams) async {
    return await _productRepository.getSearchProducts(searchParams.searchTerm);
  }
}
