import 'package:equatable/equatable.dart';

class ProductColorParams extends Equatable {
  final String codeCouleur;
  final String produitId;

  const ProductColorParams(
      {required this.codeCouleur, required this.produitId});

  @override
  List<Object?> get props => [codeCouleur, produitId];
}
