import 'package:petshop/domain/entites/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity{
  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final String? photoSecondaire;

  SubCategoryModel({
    required this.id,
    required this.nom,
    required this.photoPrincipal,
    required this.photoSecondaire,
  }) : super(
    id: id,
    nom: nom,
    photoPrincipal: photoPrincipal,
    photoSecondaire: photoSecondaire,
  );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {

    return SubCategoryModel(
      id: json['id'],
      nom: json['nom'],
      photoPrincipal: json['photo_principal'],
      photoSecondaire: json['photo_secondaire'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['photo_principal'] = this.photoPrincipal;
    data['photo_secondaire'] = this.photoSecondaire;
    return data;
  }
}
