import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';
import 'package:petshop/presentation/blocs/product_by_category/product_by_category_bloc.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';
import 'package:petshop/presentation/journeys/products_list/products_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  RefreshController? _refreshController;

  @override
  void initState() {
    _subCategoriesBloc = getItInstance<SubCategoriesBloc>();
    _subCategoriesBloc!
        .add(SubCategoriesLoadEvent(id: widget.arguments.defaultIndex));
    _productByCategoryBloc = getItInstance<ProductByCategoryBloc>();
    _productByCategoryBloc!.add(ProductByCategoryLoadEvent(
        categoryId: widget.arguments.defaultIndex, page: 1));
    _scrollController = ScrollController();
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    _subCategoriesBloc!.close();
    _productByCategoryBloc!.close();
    _scrollController!.dispose();
    _refreshController!.dispose();
    super.dispose();
  }

  void _onRefresh(BuildContext context) async {
    final productState = BlocProvider.of<ProductByCategoryBloc>(context).state;
    if (productState is ProductByCategoryLoadedState) {
      _productByCategoryBloc!.add(ProductByCategoryLoadEvent(
          categoryId: productState.categoryId, page: 1));
    }
    _refreshController?.refreshCompleted();
  }

  void _onLoading(BuildContext context) async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    final productState = BlocProvider.of<ProductByCategoryBloc>(context).state;
    if (productState is ProductByCategoryLoadedState) {
      if (productState.productResult.next != null) {
        final reduxNumberPage = RegExp(r'page=(\d+)');
        final match =
            reduxNumberPage.firstMatch(productState.productResult.next!);
        print('match is ${match?.group(1)}');
        _productByCategoryBloc!.add(ProductByCategoryLoadEvent(
          categoryId: productState.categoryId,
          page: int.parse(match?.group(1) ?? '1'),
        ));
      } else {
        _refreshController!.loadNoData();
      }
    }
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if (mounted) setState(() {});
    _refreshController?.loadComplete();
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
            return BlocListener<ProductByCategoryBloc, ProductByCategoryState>(
              listener: (context, state) {
                if (state is ProductByCategoryErrorState) {
                  var snackBar = SnackBar(
                    content: Text(
                        TranslationConstants.somethingWentWrong.t(context)),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Scaffold(
                body: NestedScrollView(
                  
                  controller: _scrollController,
                  body: SmartRefresher(
                    footer: const ClassicFooter(
                      loadStyle: LoadStyle.ShowWhenLoading,
                      completeDuration: Duration(milliseconds: 500),
                    ),
                    enablePullDown: true,
                    enablePullUp: true,
                    controller: _refreshController!,
                    onRefresh: () => _onRefresh(context),
                    onLoading: () => _onLoading(context),
                    child: ProductsList(
                      subCategories: state.subCategories,
                    ),
                  ),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) => [
                    AppBarProductsList(
                        productByCategoryBloc: _productByCategoryBloc,
                        id: state.id,
                        subCategories: state.subCategories),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class AppBarProductsList extends StatelessWidget {
  const AppBarProductsList({
    Key? key,
    required ProductByCategoryBloc? productByCategoryBloc,
    required this.subCategories,
    required this.id,
  })  : _productByCategoryBloc = productByCategoryBloc,
        super(key: key);

  final ProductByCategoryBloc? _productByCategoryBloc;
  final List<SubCategoryEntity> subCategories;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black.withAlpha(950),
      floating: true,
      snap: true,
      centerTitle: true,
      expandedHeight: Sizes.dimen_42.h,
      title: Text(
        '$id',
        style: const TextStyle(fontSize: 20),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Sizes.dimen_10.h),
        child: Container(
          height: Sizes.dimen_22.h,
          color: Colors.black.withAlpha(860),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subCategories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _productByCategoryBloc!.add(ProductByCategoryLoadEvent(
                      categoryId: subCategories[index].id!, page: 1));
                },
                child: Container(
                  padding: EdgeInsets.all(Sizes.dimen_16.w),
                  child: Text(
                    subCategories[index].nom!.capitalize(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
