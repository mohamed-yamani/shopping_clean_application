import 'package:equatable/equatable.dart';

class ProductByCategoryParams extends Equatable {
  final int id;
  final int page;

  const ProductByCategoryParams({required this.id, required this.page});

  @override
  List<Object?> get props => [id, page];
}
