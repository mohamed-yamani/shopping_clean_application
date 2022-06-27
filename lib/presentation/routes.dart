import 'package:flutter/cupertino.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/presentation/journeys/favorite/favorite_screen.dart';
import 'package:petshop/presentation/journeys/home/home_screen.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const HomeScreen(),
        RouteList.productDetail: (context) => ProductDetailScreen(
              arguments: setting.arguments as ProductDetailArguments,
            ),
        RouteList.favoriteScreen: (context) => const FavoriteScreen(),
      };
}
