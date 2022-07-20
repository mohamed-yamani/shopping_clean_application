import 'package:dartz/dartz.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';

abstract class AuthRepository {
  Future<Either<AppError, AuthEntity>> signInWithGoogle();
  Future<Either<AppError, ConvertTokenEntity>> convertToken(
      String clientId,
      String clientSecret,
      String backend,
      String refreshToken,
      String grantType);
  Future<Either<AppError, void>> saveNewSession(
      ConvertTokenEntity convertToken);
  Future<Either<AppError, ConvertTokenEntity>> getSession();
  Future<Either<AppError, void>> deleteSession();
  Future<Either<AppError, bool>> checkIfSessionExists();
}
