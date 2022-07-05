import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  final List<ProductEntity> products;
  const SearchProductCard({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1 + 1 + 1 == 3) {
      return SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: Sizes.dimen_1.w,
          crossAxisSpacing: Sizes.dimen_1.w,
          children: products.map((product) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.5,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteList.productDetail,
                    arguments: ProductDetailArguments(productId: product.id),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                          child: CachedNetworkImage(
                            imageUrl: product.photoPrincipal!,
                            key: Key(product.id.toString()),
                            cacheKey: product.id.toString(),
                            fit: BoxFit.cover,
                            // placeholder: (context, url) => Center(
                            //   child: CircularProgressIndicator(),
                            // ),
                            // errorWidget: (context, url, error) => AppErrorWidget(
                            //   error: error,
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.dimen_5.w),
                      child: Text(
                        product.nom!,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.dimen_5.w),
                      child: Text(
                        product.prix!.toString() +
                            ' ' +
                            TranslationConstants.dirhams.t(context),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteList.productDetail,
                arguments:
                    ProductDetailArguments(productId: products[index].id),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_2.w,
                vertical: Sizes.dimen_2.h,
              ),
              child: SizedBox(
                height: Sizes.dimen_160.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: Sizes.dimen_100.h,
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.dimen_16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                          child: CachedNetworkImage(
                            imageUrl: products[index].photoPrincipal!,
                            width: Sizes.dimen_300.w,
                          ),
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
                          products[index].nom!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          products[index].prix!.toString() +
                              TranslationConstants.dirhams.t(context),
                          style: Theme.of(context).textTheme.grayCaption,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: products.length);
  }
}
