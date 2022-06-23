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
  final List<String>? couleurs;
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
      couleurs: json['couleurs'].cast<String>(),
      isNew: json['is_new'],
      produitsSimilaire: json['produits_similaire'] != null
          ? (json['produits_similaire'] as List)
              .map((i) => ProduitsSimilaire.fromJson(i))
              .toList()
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
    data['couleurs'] = couleurs;
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
  String? ordre;
  String? photoPrincipal;
  double? prix;
  int? nombreCouleurs;
  List<String>? couleurs;
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
    couleurs = json['couleurs'].cast<String>();
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
