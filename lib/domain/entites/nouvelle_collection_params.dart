import 'package:equatable/equatable.dart';

class NouvelleCollectionParams extends Equatable {
  final int id;

  const NouvelleCollectionParams({required this.id});

  @override
  List<Object?> get props => [id];
}
