import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/entites/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AppError, AuthEntity>> signInWithGoogle();
}
