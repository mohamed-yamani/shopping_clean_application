import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/entites/auth_failure.dart';
import 'package:petshop/domain/entites/login_request_params.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/repositories/authentication_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class LoginWithGoogle extends UseCase<AuthEntity, NoParams> {
  final AuthRepository _authenticationRepository;

  LoginWithGoogle(this._authenticationRepository);

  @override
  Future<Either<AppError, AuthEntity>> call(NoParams params) async =>
      await _authenticationRepository.signInWithGoogle();
}
