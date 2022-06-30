import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/get_menu.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final GetMenu getMenu;
  final ShoppingBackdropBloc shoppingBackdropBloc;
  final LoadingCubit loadingCubit;

  CarouselBloc(
      {required this.loadingCubit,
      required this.shoppingBackdropBloc,
      required this.getMenu})
      : super(CarouselInitialState()) {
    on<CarouselLoadEvent>((event, emitter) async {
      loadingCubit.show();
      final Either<AppError, List<MenuEntity>> result =
          await getMenu(NoParams());
      result.fold(
        (l) => emitter(CarouselErrorState(l.appErrorType)),
        (r) {
          shoppingBackdropBloc
              .add(ShoppingBackdropChangedEvent(menu: r[event.defaultIndex]));
          return emitter(CarouselLoadedState(
              menuList: r, defaultIndex: event.defaultIndex));
        },
      );
      loadingCubit.hide();
    });
  }
}
