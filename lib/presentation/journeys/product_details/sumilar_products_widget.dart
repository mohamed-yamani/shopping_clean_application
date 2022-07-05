import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/themes/theme_color.dart';
import 'package:petshop/presentation/themes/theme_text.dart';

class SumilarProductsWidget extends StatelessWidget {
  List<ProduitsSimilaire>? produitsSimilaire;

  SumilarProductsWidget({required this.produitsSimilaire, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_100.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: produitsSimilaire?.length ?? 0,
        itemBuilder: (context, index) {
          final ProduitsSimilaire produitSimilaire = produitsSimilaire![index];
          return SizedBox(
            height: Sizes.dimen_100.h,
            width: Sizes.dimen_160.w,
            child: Card(
              color: BlocProvider.of<ThemeCubit>(context).state == Themes.light
                  ? Colors.white
                  : AppColor.vulcan,
              elevation: 1,
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_8.w,
                vertical: Sizes.dimen_4.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Sizes.dimen_8.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteList.productDetail,
                            arguments: ProductDetailArguments(
                                productId: produitSimilaire.id!));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Sizes.dimen_8.w),
                        ),
                        child: CachedNetworkImage(
                            cacheKey: produitSimilaire.id.toString(),
                            key: Key(produitSimilaire.id.toString()),
                            fit: BoxFit.fitHeight,
                            height: Sizes.dimen_100.h,
                            width: Sizes.dimen_160.w,
                            imageUrl: produitSimilaire.photoPrincipal!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_2.w,
                    ),
                    child: Text(
                      produitSimilaire.nom!,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: Sizes.dimen_18.sp,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.dimen_2.w,
                      right: Sizes.dimen_2.w,
                      bottom: Sizes.dimen_2.w,
                    ),
                    child: Text(
                      produitSimilaire.prix!.toString() +
                          ' ' +
                          TranslationConstants.dirhams.t(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.graySubtitle1,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
