import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/menu_entity.dart';

abstract class MenuRepository {
  Future<Either<AppError,List<MenuEntity>>> getMenus();
}
