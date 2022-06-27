import 'package:equatable/equatable.dart';

class ProductSearchParams extends Equatable {
  final String searchTerm;

  const ProductSearchParams({required this.searchTerm});

  @override
  List get props => [searchTerm];
}
