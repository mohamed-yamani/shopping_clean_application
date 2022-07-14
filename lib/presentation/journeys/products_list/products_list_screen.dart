import 'package:flutter/material.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';

class ProductsListScreen extends StatefulWidget {
  final ProductsListArguments arguments;
  const ProductsListScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  SubCategoriesBloc? _subCategoriesBloc;

  @override
  void initState() {
    _subCategoriesBloc= getItInstance<SubCategoriesBloc>();
    _subCategoriesBloc!.add(SubCategoriesLoadEvent(id: widget.arguments.defaultIndex));
    super.initState();
  }

  @override
  void dispose() {
    _subCategoriesBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('${widget.arguments.defaultIndex}')));
  }
}
