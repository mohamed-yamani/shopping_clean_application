part of 'photo_product_color_bloc.dart';

abstract class PhotoProductColorEvent extends Equatable {
  const PhotoProductColorEvent();
}

class PhotoProductColorLoadEvent extends PhotoProductColorEvent {
  final String codeCouleur;
  final String produitId;

  const PhotoProductColorLoadEvent(
      {required this.codeCouleur, required this.produitId});

  @override
  List<Object?> get props => [codeCouleur, produitId];
}
