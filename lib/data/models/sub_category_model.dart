class SubCategoryModel {
  int? id;
  String? nom;
  String? photoPrincipal;
  String? photoSecondaire;

  SubCategoryModel(
      {this.id, this.nom, this.photoPrincipal, this.photoSecondaire});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    photoPrincipal = json['photo_principal'];
    photoSecondaire = json['photo_secondaire'];
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
