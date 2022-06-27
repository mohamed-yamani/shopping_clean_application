part of 'serach_product_bloc.dart';

abstract class SerachProductEvent extends Equatable {
  const SerachProductEvent();

  @override
  List<Object> get props => [];
}

class SearchProductChangedEvent extends SerachProductEvent {
  final String searchTerm;

  const SearchProductChangedEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
