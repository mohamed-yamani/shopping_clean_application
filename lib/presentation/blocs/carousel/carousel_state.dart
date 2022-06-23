part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselInitialState extends CarouselState {}

class CarouselErrorState extends CarouselState {
  final AppErrorType appErrorType;

  const CarouselErrorState(this.appErrorType);

  @override
  List<Object> get props => [appErrorType];
}

class CarouselLoadedState extends CarouselState {
  final List<MenuEntity> menuList;
  final int defaultIndex;

  const CarouselLoadedState({required this.menuList, this.defaultIndex = 0})
      : assert(defaultIndex >= 0,
            'defaultIndex must be greater than or equal to 0');

  @override
  List<Object> get props => [menuList, defaultIndex];
}
