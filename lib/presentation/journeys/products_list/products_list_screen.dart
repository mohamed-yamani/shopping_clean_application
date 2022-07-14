
import 'package:flutter/material.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';

class ProductsListScreen extends StatefulWidget {
  final ProductsListArguments arguments;
  const ProductsListScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('${widget.arguments.defaultIndex}')));
  }
}