import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/nouvelleCollectionEntity.dart';
import 'package:petshop/domain/entites/nouvelle_collection_params.dart';
import 'package:petshop/domain/usecases/get_nouvelle_collection.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'nouvelle_collection_event.dart';
part 'nouvelle_collection_state.dart';

class NouvelleCollectionBloc
    extends Bloc<NouvelleCollectionEvent, NouvelleCollectionState> {
  final GetNouvelleCollection getNouvelleCollection;
  final LoadingCubit loadingCubit;
  NouvelleCollectionBloc(
      {required this.getNouvelleCollection, required this.loadingCubit})
      : super(NouvelleCollectionInitial()) {
    on<NouvelleCollectionLoadEvent>((event, emit) async {
      loadingCubit.show();
      final Either<AppError, NouvelleCollectionEntity?> eitherReponse =
          await getNouvelleCollection(NouvelleCollectionParams(id: event.id));
      eitherReponse.fold(
          (l) => emit(NouvelleCollectionError()),
          (r) => emit(NouvelleCollectionLoadedState(
              nouvelleCollection: r!, id: event.id)));
      loadingCubit.hide();
    });
  }
}
