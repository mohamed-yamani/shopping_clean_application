import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/presentation/blocs/nouvelle_collection/nouvelle_collection_bloc.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_tab_card_widget.dart';

class ShoppingListViewBuilderNewWidget extends StatelessWidget {
  const ShoppingListViewBuilderNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NouvelleCollectionBloc, NouvelleCollectionState>(
      builder: (context, state) {
        if (state is NouvelleCollectionLoadedState) {
          final products = state.nouvelleCollection.produits;
          return products!.isEmpty
              ? Center(
                  child: Text(
                    TranslationConstants.sorryNoProducts.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 14.w,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      return ShoppingTabCardWidget(
                        productId: product.id!,
                        productName: product.nom!,
                        productImgPath: product.photoPrincipal!,
                      );
                    },
                  ),
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
