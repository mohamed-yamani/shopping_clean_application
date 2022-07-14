import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/menu_entity.dart';

class MenuArguments extends Equatable {
  final List<MenuEntity> menu;
  final int defaultIndex;

  const MenuArguments({required this.menu
  , required this.defaultIndex
  });

  @override
  List<Object?> get props => [menu];
}
