import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/entites/product_serach_params.dart';
import 'package:petshop/domain/usecases/search_products.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'serach_product_event.dart';
part 'serach_product_state.dart';

class SerachProductBloc extends Bloc<SerachProductEvent, SerachProductState> {
  final SearchProducts searchProducts;
  final LoadingCubit loadingCubit;

  SerachProductBloc({required this.loadingCubit, required this.searchProducts})
      : super(SerachProductInitial()) {
    on<SearchProductChangedEvent>((event, emit) async {
      if (event.searchTerm.length > 2) {
        loadingCubit.show();
        emit(SerachProductLoading());
        print(
          "envent.searchTerm: ${event.searchTerm}",
        );
        final Either<AppError, List<ProductEntity>> result =
            await searchProducts(
                ProductSearchParams(searchTerm: event.searchTerm));
        emit(result.fold(
            (l) => SerachProductError(l), (r) => SerachProductLoaded(r)));
        loadingCubit.hide();
      }
    });
  }
}
