import 'package:petshop/domain/entites/photo_product_color_entity.dart';

class PhotoProduitColorModel extends PhotoProductColorEntity {
  final int? id;
  final String? picture;
  final String? codeCouleur;
  final String? ordre;

  PhotoProduitColorModel({this.id, this.picture, this.codeCouleur, this.ordre})
      : super(
          id: id,
          picture: picture,
          codeCouleur: codeCouleur,
          ordre: ordre,
        );

  factory PhotoProduitColorModel.fromJson(Map<String, dynamic> json) {
    return PhotoProduitColorModel(
      id: json['id'],
      picture: json['picture'],
      codeCouleur: json['code_couleur'],
      ordre: json['ordre'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['code_couleur'] = this.codeCouleur;
    data['ordre'] = this.ordre;
    return data;
  }
}
