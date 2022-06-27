import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String? nom;
  final String? ordre;
  final String? photoPrincipal;
  final double? prix;
  final int? nombreCouleurs;
  final List<Couleurs>? couleurs;
  final int? categorie;
  final String? promotion;
  final bool? isNew;
  final bool? favoris;
  final double? longeurParLargeur;
  final double? nombrePhotoCarroussel;

  const ProductEntity({
    required this.id,
    @required this.nom,
    @required this.ordre,
    @required this.photoPrincipal,
    @required this.prix,
    @required this.nombreCouleurs,
    @required this.couleurs,
    @required this.categorie,
    @required this.promotion,
    @required this.isNew,
    @required this.favoris,
    @required this.longeurParLargeur,
    @required this.nombrePhotoCarroussel,
  }) : assert(id != null, 'id cannot be null');

  @override
  List<Object> get props => [id, nom!];

  @override
  bool get stringify => true;

  factory ProductEntity.fromProductDetailsEntity(
      ProductDetailsEntity productDetails) {
    return ProductEntity(
      id: productDetails.id!,
      nom: productDetails.nom,
      ordre: null,
      photoPrincipal: productDetails.photoPrincipal,
      prix: productDetails.prix,
      nombreCouleurs: productDetails.nombreCouleurs,
      couleurs: null,
      categorie: productDetails.categorie,
      promotion: productDetails.promotion.toString(),
      isNew: productDetails.isNew,
      favoris: productDetails.favoris,
      longeurParLargeur: null,
      nombrePhotoCarroussel: null,
    );
  }
}
