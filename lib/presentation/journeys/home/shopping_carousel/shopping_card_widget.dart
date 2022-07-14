import 'package:flutter/material.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/presentation/journeys/product_details/menu_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';

class ShoppingCardWidget extends StatelessWidget {
  final List<MenuEntity> menu;
  final int defaultIndex;
  final String posterPath;
  const ShoppingCardWidget(
      {Key? key, required this.defaultIndex, required this.posterPath, required this.menu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32.0,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {
          print('onTap');
          Navigator.of(context).pushNamed(RouteList.menu,
              arguments: MenuArguments(menu: menu, defaultIndex: defaultIndex));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            key: Key(defaultIndex.toString()),
            cacheKey: defaultIndex.toString(),
            imageUrl: posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
