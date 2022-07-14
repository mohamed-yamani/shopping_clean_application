import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/menu_entity.dart';

class ProductsListArguments extends Equatable {
  final MenuEntity menu;
  final int defaultIndex;

  const ProductsListArguments({required this.menu
  , required this.defaultIndex
  });

  @override
  List<Object?> get props => [menu];
}