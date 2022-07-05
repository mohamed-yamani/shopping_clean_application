part of 'nouvelle_collection_bloc.dart';

abstract class NouvelleCollectionEvent extends Equatable {
  const NouvelleCollectionEvent();
}

class NouvelleCollectionLoadEvent extends NouvelleCollectionEvent {
  final int id;

  const NouvelleCollectionLoadEvent({required this.id});

  @override
  List<Object> get props => [id];
}
