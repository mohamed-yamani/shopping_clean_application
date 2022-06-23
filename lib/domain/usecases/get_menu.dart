import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/menu_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetMenu extends UseCase<List<MenuEntity>, NoParams> {
  final MenuRepository _repository;

  GetMenu(this._repository);
  @override
  Future<Either<AppError, List<MenuEntity>>> call(NoParams params) async {
    return await _repository.getMenus();
  }
}
