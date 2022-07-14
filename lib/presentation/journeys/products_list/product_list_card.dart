import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';

class ProductListCard extends StatelessWidget {
  final List<ProductModel>? products;
  const ProductListCard({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: Sizes.dimen_1.w,
          crossAxisSpacing: Sizes.dimen_1.w,
          children: products!.map((product) {
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
      ),
    );
  }
}
