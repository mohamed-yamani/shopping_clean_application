import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:petshop/data/models/product_model.dart';

class ProductEntity extends Equatable {
  final int? id;
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
    @required this.id,
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
  List<Object> get props => [id!, nom!];

  @override
  bool get stringify => true;
}
