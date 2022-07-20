import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class DeleteSessionUsecase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;
  DeleteSessionUsecase({required this.authRepository});
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await authRepository.deleteSession();
  }
}
