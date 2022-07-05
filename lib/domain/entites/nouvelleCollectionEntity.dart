import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/data/models/nouvelle_collection_model.dart';

class NouvelleCollectionEntity extends Equatable {
  final int? id;
  final String? nom;
  final List<NouvelleProduitsModel>? produits;

  const NouvelleCollectionEntity(
      {@required this.id, @required this.nom, @required this.produits});

  @override
  List<Object?> get props => [id, nom, produits];

  @override
  bool get stringify => true;
}
