import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';
import 'package:petshop/presentation/blocs/product_by_category/product_by_category_bloc.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';
import 'package:petshop/presentation/journeys/products_list/product_list_card.dart';

class ProductsList extends StatelessWidget {
  final List<SubCategoryEntity> subCategories;
  const ProductsList({Key? key, required this.subCategories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
      builder: (context, state) {
        if (state is ProductByCategoryLoadedState) {
          List<ProductModel>? products = state.productResult.products;
          return Expanded(
            child: ProductListCard(products: products),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
