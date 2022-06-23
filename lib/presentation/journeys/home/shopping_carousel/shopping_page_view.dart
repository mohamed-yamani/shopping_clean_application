import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/animated_shopping_card_widget.dart';

class ShoppingPageView extends StatefulWidget {
  final List<MenuEntity> menuList;
  final int initialPage;
  const ShoppingPageView(
      {Key? key, required this.menuList, required this.initialPage})
      : assert(initialPage >= 0 && initialPage < menuList.length,
            'initialPage must be greater than 0 and less than menuList.length'),
        super(key: key);

  @override
  State<ShoppingPageView> createState() => _ShoppingPageViewState();
}

class _ShoppingPageViewState extends State<ShoppingPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final MenuEntity menu = widget.menuList[index];
          return AnimatedShoppingCardWidget(
              index: index,
              pageController: _pageController,
              categoryId: menu.id!,
              posterPath: menu.photoPrincipal!);
        },
        pageSnapping: true,
        itemCount: widget.menuList.length,
        onPageChanged: (int index) {
          BlocProvider.of<ShoppingBackdropBloc>(context).add(
            ShoppingBackdropChangedEvent(menu: widget.menuList[index]),
          );
        },
      ),
    );
  }
}
