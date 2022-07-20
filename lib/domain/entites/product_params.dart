import 'package:equatable/equatable.dart';

class ProductParams extends Equatable {
  final int id;

  const ProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
// ConvertTokenParams