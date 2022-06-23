import 'package:flutter/material.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/Shopping_data_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/shopping_backdrop_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/shopping_page_view.dart';
import 'package:petshop/presentation/widgets/separator.dart';
import 'package:petshop/presentation/widgets/shopping_app_bar.dart';

class ShoppingCarouselWidget extends StatelessWidget {
  final List<MenuEntity> menuList;
  final int defaultIndex;
  const ShoppingCarouselWidget(
      {Key? key, required this.menuList, required this.defaultIndex})
      : assert(defaultIndex >= 0 && defaultIndex < menuList.length,
            'defaultIndex must be greater than 0 and less than menuList.length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ShoppingBackdropWidget(),
        Column(
          children: [
            const ShoppingAppBar(),
            ShoppingPageView(
              menuList: menuList,
              initialPage: defaultIndex,
            ),
            const ShoppingDataWedget(),
            const Separator()
          ],
        ),
      ],
    );
  }
}
