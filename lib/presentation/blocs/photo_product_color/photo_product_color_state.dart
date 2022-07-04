part of 'photo_product_color_bloc.dart';

abstract class PhotoProductColorState extends Equatable {
  const PhotoProductColorState();

  @override
  List<Object> get props => [];
}

class PhotoProductColorInitial extends PhotoProductColorState {}

class PhotoProductColorLoading extends PhotoProductColorState {}

class PhotoProductColorError extends PhotoProductColorState {}

class PhotoProductColorLoaded extends PhotoProductColorState {
  final List<PhotoProductColorEntity> photoProductColors;
  final String productId;
  final String codeCouleur;

  const PhotoProductColorLoaded(
      {required this.photoProductColors,
      required this.productId,
      required this.codeCouleur});

  @override
  List<Object> get props => [photoProductColors, productId, codeCouleur];
}
