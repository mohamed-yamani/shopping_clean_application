import 'package:petshop/domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
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

  const ProductModel(
      {required this.id,
      this.nom,
      this.ordre,
      this.photoPrincipal,
      this.prix,
      this.nombreCouleurs,
      this.couleurs,
      this.categorie,
      this.promotion,
      this.isNew,
      this.favoris,
      this.longeurParLargeur,
      this.nombrePhotoCarroussel})
      : super(
            id: id,
            nom: nom,
            ordre: ordre,
            photoPrincipal: photoPrincipal,
            prix: prix ?? 0,
            nombreCouleurs: nombreCouleurs ?? 0,
            couleurs: couleurs,
            categorie: categorie,
            promotion: promotion,
            isNew: isNew,
            favoris: favoris,
            longeurParLargeur: longeurParLargeur ?? 0,
            nombrePhotoCarroussel: nombrePhotoCarroussel ?? 0);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nom: json['nom'],
      ordre: json['ordre'],
      photoPrincipal: json['photo_principal'],
      prix: json['prix'],
      nombreCouleurs: json['nombre_couleurs'],
      couleurs: json['couleurs'] != null
          ? (json['couleurs'] as List).map((i) => Couleurs.fromJson(i)).toList()
          : null,
      categorie: json['categorie'],
      promotion: json['promotion'],
      isNew: json['is_new'],
      favoris: json['favoris'],
      longeurParLargeur: json['longeur_par_largeur'],
      nombrePhotoCarroussel: json['nombre_photo_carroussel'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nom'] = nom;
    data['ordre'] = ordre;
    data['photo_principal'] = photoPrincipal;
    data['prix'] = prix;
    data['nombre_couleurs'] = nombreCouleurs;
    if (couleurs != null) {
      data['couleurs'] = couleurs!.map((v) => v.toJson()).toList();
    }
    data['categorie'] = categorie;
    data['promotion'] = promotion;
    data['is_new'] = isNew;
    data['favoris'] = favoris;
    data['longeur_par_largeur'] = longeurParLargeur;
    data['nombre_photo_carroussel'] = nombrePhotoCarroussel;
    return data;
  }
}

class Couleurs {
  int? id;
  String? code;
  String? nom;

  Couleurs({this.id, this.code, this.nom});

  Couleurs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['nom'] = nom;
    return data;
  }
}
