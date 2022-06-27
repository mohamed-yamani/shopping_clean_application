import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
}
