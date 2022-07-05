part of 'nouvelle_collection_bloc.dart';

abstract class NouvelleCollectionState extends Equatable {
  const NouvelleCollectionState();

  @override
  List<Object> get props => [];
}

class NouvelleCollectionInitial extends NouvelleCollectionState {}

class NouvelleCollectionLoading extends NouvelleCollectionState {}

class NouvelleCollectionError extends NouvelleCollectionState {}

class NouvelleCollectionLoadedState extends NouvelleCollectionState {
  final NouvelleCollectionEntity nouvelleCollection;
  final int id;

  const NouvelleCollectionLoadedState(
      {required this.nouvelleCollection, required this.id});

  @override
  List<Object> get props => [nouvelleCollection, id];
}
