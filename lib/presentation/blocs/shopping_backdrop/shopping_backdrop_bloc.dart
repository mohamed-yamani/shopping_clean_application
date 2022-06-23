import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/domain/usecases/get_menu.dart';

part 'shopping_backdrop_event.dart';
part 'shopping_backdrop_state.dart';

class ShoppingBackdropBloc
    extends Bloc<ShoppingBackdropEvent, ShoppingBackdropState> {
  ShoppingBackdropBloc() : super(ShoppingBackdropInitialState()) {
    on<ShoppingBackdropChangedEvent>((event, emitter) async {
      emitter(ShoppingBackdropChangedState(menu: event.menu));
    });
  }
}
