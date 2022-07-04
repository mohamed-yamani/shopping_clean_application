import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/common/functions/color_from_hex.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class ColorsList extends StatelessWidget {
  final List<Couleurs> couleurs;
  const ColorsList({Key? key, required this.couleurs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_25.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: couleurs.length,
        itemBuilder: (context, index) {
          return CircleAvatar(
            radius: Sizes.dimen_18.w,
            backgroundColor:
                BlocProvider.of<ThemeCubit>(context).state == Themes.dark
                    ? Colors.white
                    : AppColor.vulcan,
            child: CircleAvatar(
              radius: Sizes.dimen_16.w,
              backgroundColor: colorFromHex(couleurs[index].codeCouleur!),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: Sizes.dimen_10.w);
        },
      ),
    );
  }
}
