part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteProductsLoadedState extends FavoriteState {
  final List<ProductEntity> fariteProducts;

  const FavoriteProductsLoadedState(this.fariteProducts);

  @override
  List<Object> get props => [fariteProducts];
}

class FavoriteProductErrorState extends FavoriteState {}

class IsFavoriteProductState extends FavoriteState {
  final bool isFavorite;

  const IsFavoriteProductState(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}
