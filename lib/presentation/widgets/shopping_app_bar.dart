import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/presentation/blocs/serach_product/serach_product_bloc.dart';
import 'package:petshop/presentation/journeys/search_product/custom_search_delegate.dart';
import 'package:petshop/presentation/widgets/logo.dart';

class ShoppingAppBar extends StatelessWidget {
  const ShoppingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                color: Colors.white,
                height: Sizes.dimen_12.h,
              ),
            ),
            Expanded(
              child: Logo(height: Sizes.dimen_10.h),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    BlocProvider.of<SerachProductBloc>(context),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
            ),
          ],
        ));
  }
}
