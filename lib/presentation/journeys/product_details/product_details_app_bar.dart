import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';

class ProductDetailsAppBar extends StatelessWidget {
  ProductDetailsEntity productDetails;
  ProductDetailsAppBar({required this.productDetails, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            productDetails.favoris! ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
      ],
    );
  }
}
