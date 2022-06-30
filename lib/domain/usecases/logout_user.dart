import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/login_request_params.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/authentication_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
      await _authenticationRepository.logoutUser();
}
