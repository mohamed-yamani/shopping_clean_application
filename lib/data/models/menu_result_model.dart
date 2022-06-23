import 'package:petshop/data/models/menu_model.dart';

class MenuResultModel {
  int? id;
  String? nom;
  String? photoPrincipal;
  List<MenuModel>? menu;
  double? longeurParLargeur;
  int? nombrePhotoCarroussel;

  MenuResultModel(
      {this.id,
      this.nom,
      this.photoPrincipal,
      this.menu,
      this.longeurParLargeur,
      this.nombrePhotoCarroussel});

  MenuResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    photoPrincipal = json['photo_principal'];
    if (json['children'] != null) {
      menu = <MenuModel>[];
      json['children'].forEach((v) {
        menu!.add(MenuModel.fromJson(v));
      });
    }
    longeurParLargeur = json['longeur_par_largeur'];
    nombrePhotoCarroussel = json['nombre_photo_carroussel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nom'] = nom;
    data['photo_principal'] = photoPrincipal;
    if (menu != null) {
      data['children'] = menu!.map((v) => v.toJson()).toList();
    }
    data['longeur_par_largeur'] = longeurParLargeur;
    data['nombre_photo_carroussel'] = nombrePhotoCarroussel;
    return data;
  }
}
