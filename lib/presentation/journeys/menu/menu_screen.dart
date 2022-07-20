import 'package:flutter/material.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/journeys/product_details/menu_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/products_list_arguments.dart';

class MenuScreen extends StatelessWidget {
  final MenuArguments arguments;
  const MenuScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: arguments.menu.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          bottom: TabBar(
            isScrollable: true,
            tabs: arguments.menu.map((menu) {
              return Tab(
                text: menu.nom!.capitalize(),
              );
            }).toList(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                children: arguments.menu
                    .map(
                      (category1) => Padding(
                        padding: EdgeInsets.all(Sizes.dimen_20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: category1.children!
                              .map((category2) => Padding(
                                    padding: EdgeInsets.all(Sizes.dimen_16.w),
                                    child: InkWell(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        RouteList.productsList,
                                        arguments: ProductsListArguments(
                                            defaultIndex: category2.id,
                                            menu: category1),
                                      ),
                                      child: Text(
                                        category2.nom!.toString().capitalize(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: Sizes.dimen_24.sp,
                                            ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
