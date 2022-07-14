import 'package:flutter/widgets.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/shopping_card_widget.dart';

class AnimatedShoppingCardWidget extends StatelessWidget {
  final int index;
  final int categoryId;
  final String posterPath;
  final PageController pageController;
  final List<MenuEntity> menu;

  const AnimatedShoppingCardWidget(
      {Key? key,
      required this.index,
      required this.categoryId,
      required this.posterPath,
      required this.menu,
      required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: ShoppingCardWidget(
        defaultIndex: index,
        posterPath: posterPath,
        menu: menu,
      ),
    );
  }
}
