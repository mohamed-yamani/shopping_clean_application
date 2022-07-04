import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/photo_product_color_entity.dart';
import 'package:petshop/domain/entites/product_color_params.dart';
import 'package:petshop/domain/usecases/get_photo_product_color.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'photo_product_color_event.dart';
part 'photo_product_color_state.dart';

class PhotoProductColorBloc
    extends Bloc<PhotoProductColorEvent, PhotoProductColorState> {
  final GetPhotoProductColor getPhotoProductColor;
  final LoadingCubit loadingCubit;

  PhotoProductColorBloc(
      {required this.getPhotoProductColor, required this.loadingCubit})
      : super(PhotoProductColorInitial()) {
    on<PhotoProductColorLoadEvent>((event, emit) async {
      loadingCubit.show();
      final Either<AppError, List<PhotoProductColorEntity>> eitherReponse =
          await getPhotoProductColor(ProductColorParams(
              produitId: event.produitId, codeCouleur: event.codeCouleur));
      eitherReponse.fold(
        (l) => emit(PhotoProductColorError()),
        (r) => emit(PhotoProductColorLoaded(
            codeCouleur: event.codeCouleur,
            productId: event.produitId,
            photoProductColors: r)),
      );
      loadingCubit.hide();
    });
  }
}
