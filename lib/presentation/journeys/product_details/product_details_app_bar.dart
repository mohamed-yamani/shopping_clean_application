import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/blocs/favorite/favorite_bloc.dart';

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
        BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
          if (state is IsFavoriteProductState) {
            print('is favorite page ${state.isFavorite}');
            return IconButton(
              onPressed: () => BlocProvider.of<FavoriteBloc>(context).add(
                  ToggleFavoriteProductEvent(
                      ProductEntity.fromProductDetailsEntity(productDetails),
                      state.isFavorite)),
              icon: Icon(
                state.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                BlocProvider.of<FavoriteBloc>(context).add(
                    ToggleFavoriteProductEvent(
                        ProductEntity.fromProductDetailsEntity(productDetails),
                        productDetails.favoris!));
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: Sizes.dimen_12.h,
              ),
            );
          }
        }),
      ],
    );
  }
}
