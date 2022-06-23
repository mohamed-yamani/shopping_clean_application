import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuEntity extends Equatable {
  final int? id;
  final String? nom;
  final String? photoPrincipal;
  final List? children;
  final double? longeurParLargeur;
  final int? nombrePhotoCarroussel;

  const MenuEntity({
    @required this.id,
    @required this.nom,
    @required this.photoPrincipal,
    @required this.children,
    @required this.longeurParLargeur,
    @required this.nombrePhotoCarroussel,
  }) : assert(id != null, 'id cannot be null');

  @override
  List<Object> get props => [id!, nom!];

  @override
  bool get stringify => true;
}
