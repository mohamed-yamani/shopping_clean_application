import 'package:equatable/equatable.dart';

class PhotoProductColorEntity extends Equatable {
  final int? id;
  final String? picture;
  final String? codeCouleur;
  final String? ordre;

  PhotoProductColorEntity(
      {required this.id,
      required this.picture,
      required this.codeCouleur,
      required this.ordre});

  @override
  List<Object?> get props => [id, picture, codeCouleur, ordre];

  @override
  bool get stringify => true;
}
