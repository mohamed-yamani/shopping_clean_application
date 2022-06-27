import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/journeys/favorite/favorite_product_card_widget.dart';

class FavoriteProductGridView extends StatelessWidget {
  final List<ProductEntity> favoriteProducts;

  const FavoriteProductGridView({Key? key, required this.favoriteProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: favoriteProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: Sizes.dimen_16.w,
          mainAxisSpacing: Sizes.dimen_16.w,
        ),
        itemBuilder: (context, index) {
          return FavoriteProductCardWidget(
            favoriteProduct: favoriteProducts[index],
          );
        },
      ),
    );
  }
}
