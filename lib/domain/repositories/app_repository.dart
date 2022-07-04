import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';

abstract class AppRepository {
  //! update and get preferred language
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
  //! update and get preferred theme
  Future<Either<AppError, void>> updateTheme(String theme);
  Future<Either<AppError, String>> getPreferredTheme();
}
