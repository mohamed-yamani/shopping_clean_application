import 'package:flutter/widgets.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_tab_card_widget.dart';

class ShoppingListViewBuilderWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const ShoppingListViewBuilderWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 14.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          final ProductEntity product = products[index];
          return ShoppingTabCardWidget(
            productId: product.id!,
            productName: product.nom!,
            productImgPath: product.photoPrincipal!,
          );
        },
      ),
    );
  }
}
