import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/data/models/product_result_model.dart';
import 'package:petshop/domain/entites/nouvelleCollectionEntity.dart';

class NouvelleCollectionModel extends NouvelleCollectionEntity {
  final int? id;
  final String? nom;
  final List<NouvelleProduitsModel>? produits;

  const NouvelleCollectionModel({this.id, this.nom, this.produits})
      : super(id: id, nom: nom, produits: produits);

  factory NouvelleCollectionModel.fromJson(Map<String, dynamic> json) {
    return NouvelleCollectionModel(
        id: json['id'],
        nom: json['nom'],
        produits: json['produits'] != null
            ? (json['produits'] as List)
                .map((i) => NouvelleProduitsModel.fromJson(i))
                .toList()
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    if (this.produits != null) {
      data['produits'] = this.produits!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ProductResultModel toProductResultModel() {
    return ProductResultModel(
      count: produits?.length,
      next: null,
      previous: null,
      products: produits!.map((e) => e.toProductModel()).toList(),
    );
  }
}

class NouvelleProduitsModel {
  int? id;
  String? nom;
  int? ordre;
  String? photoPrincipal;
  double? prix;
  int? nombreCouleurs;
  List<Couleurs>? couleurs;
  int? categorie;
  bool? promotion;
  bool? isNew;
  bool? favoris;
  double? longeurParLargeur;
  double? nombrePhotoCarroussel;

  NouvelleProduitsModel(
      {this.id,
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
      this.nombrePhotoCarroussel});

  NouvelleProduitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    ordre = json['ordre'];
    photoPrincipal = json['photo_principal'];
    prix = json['prix'];
    nombreCouleurs = json['nombre_couleurs'];
    if (json['couleurs'] != null) {
      couleurs = <Couleurs>[];
      json['couleurs'].forEach((v) {
        couleurs!.add(new Couleurs.fromJson(v));
      });
    }
    categorie = json['categorie'];
    promotion = json['promotion'];
    isNew = json['is_new'];
    favoris = json['favoris'];
    longeurParLargeur = json['longeur_par_largeur'];
    nombrePhotoCarroussel = json['nombre_photo_carroussel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['ordre'] = this.ordre;
    data['photo_principal'] = this.photoPrincipal;
    data['prix'] = this.prix;
    data['nombre_couleurs'] = this.nombreCouleurs;
    if (this.couleurs != null) {
      data['couleurs'] = this.couleurs!.map((v) => v.toJson()).toList();
    }
    data['categorie'] = this.categorie;
    data['promotion'] = this.promotion;
    data['is_new'] = this.isNew;
    data['favoris'] = this.favoris;
    data['longeur_par_largeur'] = this.longeurParLargeur;
    data['nombre_photo_carroussel'] = this.nombrePhotoCarroussel;
    return data;
  }

  ProductModel toProductModel() {
    return ProductModel(
      id: id!,
      nom: nom,
      ordre: ordre,
      photoPrincipal: photoPrincipal,
      prix: prix,
      nombreCouleurs: nombreCouleurs,
      couleurs: null,
      categorie: categorie,
      promotion: null,
      isNew: isNew,
      favoris: favoris,
      longeurParLargeur: longeurParLargeur,
      nombrePhotoCarroussel: nombrePhotoCarroussel,
    );
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nom'] = this.nom;
    return data;
  }

  // ProductModel

  ProductModel toProductModel() {
    return ProductModel(
        id: id!,
        nom: nom,
        prix: null,
        photoPrincipal: null,
        nombreCouleurs: null,
        couleurs: null,
        categorie: null,
        promotion: null,
        isNew: null,
        favoris: null,
        longeurParLargeur: null,
        nombrePhotoCarroussel: null);
  }
}
