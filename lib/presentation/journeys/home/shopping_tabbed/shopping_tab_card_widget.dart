import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_screen.dart';

class ShoppingTabCardWidget extends StatelessWidget {
  final int productId;
  final String productName, productImgPath;

  const ShoppingTabCardWidget(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.productImgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteList.productDetail,
            arguments: ProductDetailArguments(productId: productId));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
                imageUrl: productImgPath,
                fit: BoxFit.cover,
                key: Key(productId.toString()),
                cacheKey: productId.toString(),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_4.h),
              child: Text(productName.intelliTrim(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1)),
        ],
      ),
    );
  }
}
