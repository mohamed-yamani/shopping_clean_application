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
  ScrollController? _scrollController;

  @override
  void initState() {
    _subCategoriesBloc = getItInstance<SubCategoriesBloc>();
    _subCategoriesBloc!
        .add(SubCategoriesLoadEvent(id: widget.arguments.defaultIndex));
    _productByCategoryBloc = getItInstance<ProductByCategoryBloc>();
    _productByCategoryBloc!.add(
        ProductByCategoryLoadEvent(categoryId: widget.arguments.defaultIndex));
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _subCategoriesBloc!.close();
    _productByCategoryBloc!.close();
    _scrollController!.dispose();
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
            return Scaffold(
              body: NestedScrollView(
                controller: _scrollController,
                body: Column(
                  children: [
                    ProductsList(
                      subCategories: state.subCategories,
                    ),
                  ],
                ),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.black.withAlpha(950),
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    expandedHeight: Sizes.dimen_42.h,
                    title: Text(
                      '${state.id}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(Sizes.dimen_10.h),
                      child: Container(
                        height: Sizes.dimen_22.h,
                        color: Colors.black.withAlpha(860),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.subCategories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _productByCategoryBloc!
                                    .add(ProductByCategoryLoadEvent(
                                  categoryId: state.subCategories[index].id!,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(Sizes.dimen_16.w),
                                child: Text(
                                  state.subCategories[index].nom!.capitalize(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
