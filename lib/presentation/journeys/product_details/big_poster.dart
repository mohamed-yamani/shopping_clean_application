import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/journeys/product_details/product_details_app_bar.dart';
import 'package:petshop/presentation/themes/theme_text.dart';

class BigPoster extends StatelessWidget {
  final ProductDetailsEntity productDetails;
  const BigPoster({required this.productDetails, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: productDetails.photoPrincipal!,
            width: ScreenUtil.screenWidth,
            cacheKey: productDetails.photoPrincipal!,
            key: Key(productDetails.photoPrincipal!),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              productDetails.nom!,
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing: Text(
              '${productDetails.prix!} Dhs',
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
            left: Sizes.dimen_16.w,
            right: Sizes.dimen_16.w,
            top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
            child: ProductDetailsAppBar(productDetails: productDetails)),
      ],
    );
  }
}
