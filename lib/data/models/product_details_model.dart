import 'package:petshop/domain/entites/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final double? prix;
  final int? nombreCouleurs;
  final int? categorie;
  final bool? promotion;
  final String? description;
  final List<Couleurs>? couleurs;
  final bool? isNew;
  final List<ProduitsSimilaire>? produitsSimilaire;
  final bool? favoris;

  const ProductDetailsModel(
      {this.id,
      this.nom,
      this.photoPrincipal,
      this.prix,
      this.nombreCouleurs,
      this.categorie,
      this.promotion,
      this.description,
      this.couleurs,
      this.isNew,
      this.produitsSimilaire,
      this.favoris})
      : super(
            id: id,
            nom: nom,
            photoPrincipal: photoPrincipal,
            prix: prix ?? 0,
            nombreCouleurs: nombreCouleurs ?? 0,
            categorie: categorie,
            promotion: promotion,
            description: description,
            couleurs: couleurs,
            isNew: isNew,
            produitsSimilaire: produitsSimilaire,
            favoris: favoris);

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      nom: json['nom'],
      photoPrincipal: json['photo_principal'],
      prix: json['prix'],
      nombreCouleurs: json['nombre_couleurs'],
      categorie: json['categorie'],
      promotion: json['promotion'],
      description: json['description'],
      isNew: json['is_new'],
      produitsSimilaire: json['produits_similaire'] != null
          ? (json['produits_similaire'] as List)
              .map((i) => ProduitsSimilaire.fromJson(i))
              .toList()
          : null,
      couleurs: json['couleurs'] != null
          ? (json['couleurs'] as List).map((i) => Couleurs.fromJson(i)).toList()
          : null,
      favoris: json['favoris'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nom'] = nom;
    data['photo_principal'] = photoPrincipal;
    data['prix'] = prix;
    data['nombre_couleurs'] = nombreCouleurs;
    data['categorie'] = categorie;
    data['promotion'] = promotion;
    data['description'] = description;
    // data['couleurs'] = couleurs;
    if (couleurs != null) {
      data['couleurs'] = couleurs!.map((v) => v.toJson()).toList();
    }
    data['is_new'] = isNew;
    if (produitsSimilaire != null) {
      data['produits_similaire'] =
          produitsSimilaire!.map((v) => v.toJson()).toList();
    }

    data['favoris'] = favoris;
    return data;
  }
}

class ProduitsSimilaire {
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

  ProduitsSimilaire(
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

  ProduitsSimilaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    ordre = json['ordre'];
    photoPrincipal = json['photo_principal'];
    prix = json['prix'];
    nombreCouleurs = json['nombre_couleurs'];
    couleurs = json['couleurs'] != null
        ? (json['couleurs'] as List).map((i) => Couleurs.fromJson(i)).toList()
        : null;
    categorie = json['categorie'];
    promotion = json['promotion'];
    isNew = json['is_new'];
    favoris = json['favoris'];
    longeurParLargeur = json['longeur_par_largeur'];
    nombrePhotoCarroussel = json['nombre_photo_carroussel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['ordre'] = ordre;
    data['photo_principal'] = photoPrincipal;
    data['prix'] = prix;
    data['nombre_couleurs'] = nombreCouleurs;
    data['couleurs'] = couleurs;
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
  String? codeCouleur;
  bool? principal;
  double? prix;

  Couleurs({this.id, this.codeCouleur, this.principal, this.prix});

  Couleurs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codeCouleur = json['code_couleur'];
    principal = json['principal'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code_couleur'] = this.codeCouleur;
    data['principal'] = this.principal;
    data['prix'] = this.prix;
    return data;
  }
}
