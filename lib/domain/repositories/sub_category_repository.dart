import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';

abstract class SubCategoryRepository {
  Future<Either<AppError, List<SubCategoryEntity>>> getSubCategories( {required int id});
}