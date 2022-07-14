import 'package:equatable/equatable.dart';

class SubCategoryParams extends Equatable {
  final int id;

  const SubCategoryParams({required this.id});

  @override
  List<Object?> get props => [id];
}