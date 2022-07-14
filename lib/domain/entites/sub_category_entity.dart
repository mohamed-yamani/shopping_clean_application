import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  const SubCategoryEntity(  {
    required this.id,
    required this.nom,
    this.photoPrincipal,  this.photoSecondaire,
  });

  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final String? photoSecondaire;
  
  @override
  List<Object?> get props => [id, nom];

  @override
  bool get stringify => true;

}