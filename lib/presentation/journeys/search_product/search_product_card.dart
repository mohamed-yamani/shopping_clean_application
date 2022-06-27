import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_screen.dart';
import 'package:petshop/presentation/themes/theme_text.dart';

class SearchProductCard extends StatelessWidget {
  final List<ProductEntity> product;
  const SearchProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteList.productDetail,
                  arguments:
                      ProductDetailArguments(productId: product[index].id));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_2.w,
                vertical: Sizes.dimen_2.h,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Sizes.dimen_16.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                      child: CachedNetworkImage(
                        imageUrl: product[index].photoPrincipal!,
                        width: Sizes.dimen_300.w,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        product[index].nom!,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        product[index].prix!.toString() +
                            TranslationConstants.dirhams.t(context),
                        style: Theme.of(context).textTheme.grayCaption,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: product.length);
  }
}
