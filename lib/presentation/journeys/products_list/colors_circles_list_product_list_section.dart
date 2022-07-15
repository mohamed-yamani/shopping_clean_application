import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';

import 'package:petshop/common/functions/color_from_hex.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/blocs/photo_product_color/photo_product_color_bloc.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class ColorsCirclesListProductListSection extends StatelessWidget {
  final ProductModel productDetails;
  const ColorsCirclesListProductListSection(
      {Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productDetails.couleurs!.length > 1) {
      return SizedBox(
        height: Sizes.dimen_16.h,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: productDetails.couleurs!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => BlocProvider.of<PhotoProductColorBloc>(context).add(
                  PhotoProductColorLoadEvent(
                      codeCouleur: productDetails.couleurs![index].code!,
                      produitId: productDetails.id.toString())),
              child: CircleAvatar(
                radius: Sizes.dimen_10.w,
                backgroundColor: Colors.white.withAlpha(95),
                child: CircleAvatar(
                  radius: Sizes.dimen_9.w,
                  backgroundColor:
                      colorFromHex(productDetails.couleurs![index].code!),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: Sizes.dimen_5.w);
          },
        ),
      );
    }
    return SizedBox(
      height: Sizes.dimen_20.h,
    );
  }
}
