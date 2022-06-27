import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_screen.dart';

class FavoriteProductCardWidget extends StatelessWidget {
  final ProductEntity favoriteProduct;
  const FavoriteProductCardWidget({Key? key, required this.favoriteProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).pushNamed(RouteList.productDetail, arguments: ProductDetailArguments(productId: favoriteProduct.id)),
         
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: favoriteProduct.photoPrincipal!,
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
                cacheKey: favoriteProduct.photoPrincipal,
                key: Key(favoriteProduct.photoPrincipal!),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                    DeleteFavoriteProductEvent(
                      favoriteProduct.id,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: Sizes.dimen_25.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
