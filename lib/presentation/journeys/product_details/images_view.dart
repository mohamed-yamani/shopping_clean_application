import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/blocs/photo_product_color/photo_product_color_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/product_details_app_bar.dart';
import 'package:petshop/presentation/themes/theme_color.dart';
import 'package:petshop/presentation/themes/theme_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailImagesView extends StatelessWidget {
  final ProductDetailsEntity productDetails;
  final PageController _controller = PageController();

  DetailImagesView({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Sizes.dimen_230.h,
          child: BlocBuilder<PhotoProductColorBloc, PhotoProductColorState>(
            builder: (context, state) {
              if (state is PhotoProductColorLoaded) {
                return PageView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var i = 0; i < state.photoProductColors.length; i++)
                      CachedNetworkImage(
                        imageUrl: state.photoProductColors[i].picture!,
                        fit: BoxFit.cover,
                        cacheKey: state.photoProductColors[i].picture!,
                        key: Key(state.photoProductColors[i].picture!),
                      ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
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
          bottom: Sizes.dimen_50.h,
          child: BlocBuilder<PhotoProductColorBloc, PhotoProductColorState>(
            builder: (context, state) {
              if (state is PhotoProductColorLoaded) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
                  child: SmoothPageIndicator(
                    axisDirection: Axis.vertical,
                    controller: _controller,
                    count: state.photoProductColors.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: Sizes.dimen_12.w,
                      dotWidth: Sizes.dimen_12.w,
                      dotColor: AppColor.violet,
                      activeDotColor: AppColor.violet,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
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
