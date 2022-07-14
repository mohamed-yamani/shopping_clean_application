part of 'sub_categories_bloc.dart';

abstract class SubCategoriesEvent extends Equatable {
  const SubCategoriesEvent();
}

class SubCategoriesLoadEvent extends SubCategoriesEvent {
  final int id;

  const SubCategoriesLoadEvent({required this.id});
  
  @override
  List<Object?> get props => [id];
}
