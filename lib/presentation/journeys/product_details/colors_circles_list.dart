import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';

import 'package:petshop/common/functions/color_from_hex.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/blocs/photo_product_color/photo_product_color_bloc.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class ColorsCirclesList extends StatelessWidget {
  final List<Couleurs> couleurs;
  final ProductDetailsEntity productDetails;
  const ColorsCirclesList(
      {Key? key, required this.couleurs, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_25.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: couleurs.length,
        itemBuilder: (context, index) {
          return BlocBuilder<PhotoProductColorBloc, PhotoProductColorState>(
            builder: (context, state) {
              if (state is PhotoProductColorLoaded) {
                return GestureDetector(
                  onTap: () => BlocProvider.of<PhotoProductColorBloc>(context)
                      .add(PhotoProductColorLoadEvent(
                          codeCouleur: couleurs[index].codeCouleur!,
                          produitId: productDetails.id.toString())),
                  child: CircleAvatar(
                    radius: state.codeCouleur == couleurs[index].codeCouleur
                        ? Sizes.dimen_19.w
                        : Sizes.dimen_17.w,
                    backgroundColor:
                        BlocProvider.of<ThemeCubit>(context).state ==
                                Themes.dark
                            ? Colors.white.withAlpha(90)
                            : AppColor.vulcan.withAlpha(90),
                    child: CircleAvatar(
                      radius: Sizes.dimen_16.w,
                      backgroundColor:
                          colorFromHex(couleurs[index].codeCouleur!),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: Sizes.dimen_10.w);
        },
      ),
    );
  }
}
