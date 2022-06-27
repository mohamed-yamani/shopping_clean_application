part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class LoadFavoriteProductEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class DeleteFavoriteProductEvent extends FavoriteEvent {
  final int productId;

  const DeleteFavoriteProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class ToggleFavoriteProductEvent extends FavoriteEvent {
  final ProductEntity product;
  final bool isFavorite;

  const ToggleFavoriteProductEvent(this.product, this.isFavorite);

  @override
  List<Object?> get props => [product, isFavorite];
}

class CheckIfProductFavoriteEvent extends FavoriteEvent {
  final int productId;

  const CheckIfProductFavoriteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
