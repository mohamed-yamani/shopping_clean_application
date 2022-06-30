import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoadingEvent>((event, emit) {
      emit(LoadingStarted());
    });
    on<StopLoadingEvent>((event, emit) {
      emit(LoadingFinished());
    });
  }
}
