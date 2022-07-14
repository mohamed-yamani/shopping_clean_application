import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/blocs/product_by_category/product_by_category_bloc.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';
import 'package:petshop/presentation/journeys/products_list/products_list.dart';

class ProductsListScreen extends StatefulWidget {
  final ProductsListArguments arguments;
  const ProductsListScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen>
    with TickerProviderStateMixin {
  SubCategoriesBloc? _subCategoriesBloc;
  ProductByCategoryBloc? _productByCategoryBloc;

  @override
  void initState() {
    _subCategoriesBloc = getItInstance<SubCategoriesBloc>();
    _subCategoriesBloc!
        .add(SubCategoriesLoadEvent(id: widget.arguments.defaultIndex));
    _productByCategoryBloc = getItInstance<ProductByCategoryBloc>();
    _productByCategoryBloc!.add(
        ProductByCategoryLoadEvent(categoryId: widget.arguments.defaultIndex));
    super.initState();
  }

  @override
  void dispose() {
    _subCategoriesBloc!.close();
    _productByCategoryBloc!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _subCategoriesBloc!),
        BlocProvider.value(value: _productByCategoryBloc!),
      ],
      child: BlocBuilder<SubCategoriesBloc, SubCategoriesState>(
        builder: (context, state) {
          if (state is SubCategoriesLoaded) {
            return DefaultTabController(
              length: state.subCategories.length,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      '${state.id}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    centerTitle: true,
                    bottom: TabBar(
                      key: const Key('tabBar'),
                      isScrollable: true,
                      onTap: (value) {
                        _productByCategoryBloc!.add(ProductByCategoryLoadEvent(
                          categoryId: state.subCategories[value].id!,
                        ));
                      },
                      indicator: UnderlineTabIndicator(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        insets:
                            EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                      ),
                      tabs: state.subCategories.map((subCategory) {
                        return Tab(
                          text: subCategory.nom!.capitalize(),
                        );
                      }).toList(),
                    ),
                  ),
                  body: ProductsList(
                    subCategories: state.subCategories,
                  )),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
