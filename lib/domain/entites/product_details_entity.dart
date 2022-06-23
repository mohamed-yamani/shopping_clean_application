import 'package:equatable/equatable.dart';
import 'package:petshop/data/models/product_details_model.dart';

class ProductDetailsEntity extends Equatable {
  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final double? prix;
  final int? nombreCouleurs;
  final int? categorie;
  final bool? promotion;
  final String? description;
  final List<String>? couleurs;
  final bool? isNew;
  final List<ProduitsSimilaire>? produitsSimilaire;
  final bool? favoris;

  const ProductDetailsEntity({
    required this.id,
    required this.nom,
    required this.photoPrincipal,
    required this.prix,
    required this.nombreCouleurs,
    required this.categorie,
    required this.promotion,
    required this.description,
    required this.couleurs,
    required this.isNew,
    required this.produitsSimilaire,
    required this.favoris,
  });

  @override
  List<Object?> get props => [id, nom];

  @override
  bool get stringify => true;
}
