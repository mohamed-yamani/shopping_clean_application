part of 'sub_categories_bloc.dart';

abstract class SubCategoriesState extends Equatable {
  const SubCategoriesState();

  @override
  List<Object> get props => [];
}

class SubCategoriesInitial extends SubCategoriesState {}

class SubCategoriesLoading extends SubCategoriesState {}

class SubCategoriesError extends SubCategoriesState {}

class SubCategoriesLoaded extends SubCategoriesState {
  final List<SubCategoryEntity> subCategories;
  final int id;

  const SubCategoriesLoaded({required this.subCategories,required this.id});

  @override
  List<Object> get props => [subCategories, id];
  
}
