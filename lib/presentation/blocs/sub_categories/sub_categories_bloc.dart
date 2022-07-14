import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';
import 'package:petshop/domain/entites/sub_category_params.dart';
import 'package:petshop/domain/usecases/get_sub_categories.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'sub_categories_event.dart';
part 'sub_categories_state.dart';

class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  final LoadingCubit loadingCubit;
  final GetSubCatogeries getSubCategories;
  SubCategoriesBloc(
      {required this.loadingCubit, required this.getSubCategories})
      : super(SubCategoriesInitial()) {
    on<SubCategoriesLoadEvent>((event, emit) async {
      loadingCubit.show();
      final Either<AppError, List<SubCategoryEntity>> eitherReponse =
          await getSubCategories(SubCategoryParams(id: event.id));
      eitherReponse.fold(
        (l) => emit(SubCategoriesError()),
        (r) => emit(SubCategoriesLoaded(subCategories: r, id: event.id)),
      );
      loadingCubit.hide();
    });
  }
}
