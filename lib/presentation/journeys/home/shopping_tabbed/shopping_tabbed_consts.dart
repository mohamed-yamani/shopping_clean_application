import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/tab.dart';

class ShoppingTabbedConsts {
  static const List<Tab> shoppingTabbedTabs = [
    Tab(
      title: TranslationConstants.newProducts,
      index: 0,
    ),
    Tab(
      title: TranslationConstants.promotion,
      index: 1,
    ),
    Tab(
      title: TranslationConstants.popular,
      index: 2,
    ),
  ];
}
