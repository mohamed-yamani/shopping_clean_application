import 'package:flutter/cupertino.dart';
import 'package:petshop/domain/entites/menu_entity.dart';

class MenuModel extends MenuEntity {
  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final List? children;
  final double? longeurParLargeur;
  final int? nombrePhotoCarroussel;

  const MenuModel(
      {this.id,
      this.nom,
      this.photoPrincipal,
      this.children,
      this.longeurParLargeur,
      this.nombrePhotoCarroussel})
      : super(
            id: id,
            nom: nom,
            photoPrincipal: photoPrincipal,
            children: children,
            longeurParLargeur: longeurParLargeur,
            nombrePhotoCarroussel: nombrePhotoCarroussel);

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      nom: json['nom'],
      photoPrincipal: json['photo_principal'],
      children: json['children'] != null
          ? (json['children'] as List)
              .map((i) => MenuModel.fromJson(i))
              .toList()
          : null,
      longeurParLargeur: json['longeur_par_largeur'],
      nombrePhotoCarroussel: json['nombre_photo_carroussel'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nom'] = nom;
    data['photo_principal'] = photoPrincipal;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    data['longeur_par_largeur'] = longeurParLargeur;
    data['nombre_photo_carroussel'] = nombrePhotoCarroussel;
    return data;
  }
}
