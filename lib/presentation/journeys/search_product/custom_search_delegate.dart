import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/blocs/serach_product/serach_product_bloc.dart';
import 'package:petshop/presentation/journeys/search_product/search_product_card.dart';
import 'package:petshop/presentation/themes/theme_color.dart';
import 'package:petshop/presentation/themes/theme_text.dart';
import 'package:petshop/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SerachProductBloc searchProductBloc;

  CustomSearchDelegate(this.searchProductBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppColor.vulcan,
          ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: Theme.of(context).textTheme.graySubtitle1,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
            onPressed: () => {
                  query.isNotEmpty ? query = '' : null,
                },
            icon: Icon(
              Icons.backspace,
              color: Colors.grey,
              size: Sizes.dimen_8.h,
            )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus?.unfocus();
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_10.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchProductBloc.add(SearchProductChangedEvent(query));
    return BlocProvider.value(
      value: searchProductBloc,
      child: BlocBuilder<SerachProductBloc, SerachProductState>(
        builder: (context, state) {
          if (state is SerachProductLoaded) {
            final product = state.products;
            if (product.isEmpty) {
              return Text(
                'No results found',
                style: Theme.of(context).textTheme.graySubtitle1.copyWith(
                      color: Colors.white,
                    ),
              );
            } else {
              return SearchProductCard(product: product);
            }
          } else if (state is SerachProductError) {
            return AppErrorWidget(
                appErrorType: state.error.appErrorType,
                onPressed: () =>
                    searchProductBloc.add(SearchProductChangedEvent(query)));
          } else {
            return const Center(
              child: Text('No results found'),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search for products'),
    );
  }
}
