import 'package:flutter/cupertino.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/presentation/journeys/favorite/favorite_screen.dart';
import 'package:petshop/presentation/journeys/home/home_screen.dart';
import 'package:petshop/presentation/journeys/login/login_screen.dart';
import 'package:petshop/presentation/journeys/menu/menu_screen.dart';
import 'package:petshop/presentation/journeys/product_details/menu_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_screen.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';
import 'package:petshop/presentation/journeys/products_list/products_list_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const LoginScreen(),
        // RouteList.initial: (context) => LoadingScreen(
        //       screen: setting.arguments as Widget,
        //     ),
        RouteList.home: (context) => const HomeScreen(),
        RouteList.productDetail: (context) => ProductDetailScreen(
              arguments: setting.arguments as ProductDetailArguments,
            ),
        RouteList.menu: (context) =>  MenuScreen(
              arguments: setting.arguments as MenuArguments,
            ),
        RouteList.productsList: (context) =>  ProductsListScreen(
              arguments: setting.arguments  as ProductsListArguments,
            
        ),
        
        RouteList.favoriteScreen: (context) => const FavoriteScreen(),
      };
}
