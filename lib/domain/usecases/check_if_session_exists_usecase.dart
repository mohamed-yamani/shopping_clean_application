import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class CheckIFSessionExistsUsecase extends UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  CheckIFSessionExistsUsecase({required this.authRepository});
  @override
  Future<Either<AppError, bool>> call(NoParams params) async {
    return await authRepository.checkIfSessionExists();
  }

  @override
  String toString() => 'CheckIFSessionExistsUsecase';
}
