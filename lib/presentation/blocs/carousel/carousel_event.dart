part of 'carousel_bloc.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends CarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0,
            'defaultIndex must be greater than or equal to 0');

  @override
  List<Object> get props => [defaultIndex];
}
