import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/blocs/shopping_tabbed/shopping_tabbed_bloc.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_list_view_build_new_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_list_view_builder_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_tabbed_consts.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/tab_title_wedget.dart';
import 'package:petshop/presentation/journeys/loading/loading_circle.dart';
import 'package:petshop/presentation/widgets/app_error_widget.dart';

class ShoppingTabbedWidget extends StatefulWidget {
  const ShoppingTabbedWidget({Key? key}) : super(key: key);

  @override
  State<ShoppingTabbedWidget> createState() => _ShoppingTabbedWidgetState();
}

class _ShoppingTabbedWidgetState extends State<ShoppingTabbedWidget>
    with SingleTickerProviderStateMixin {
  ShoppingTabbedBloc get shoppingTabbedBloc =>
      BlocProvider.of<ShoppingTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    shoppingTabbedBloc
        .add(const ShoppingTabbedChangedEvent(currentTabIndex: 0));
  }

  @override
  void dispose() {
    shoppingTabbedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingTabbedBloc, ShoppingTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(children: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var currentTab = 0;
                      currentTab <
                          ShoppingTabbedConsts.shoppingTabbedTabs.length;
                      currentTab++)
                    TabTitleWedget(
                      title: ShoppingTabbedConsts
                          .shoppingTabbedTabs[currentTab].title,
                      onTap: () => _onTapChanged(currentTab),
                      isSelected: ShoppingTabbedConsts
                              .shoppingTabbedTabs[currentTab].index ==
                          state.currentTabIndex,
                    ),
                ]),
            if (state is ShoppingTabbedChangedState)
              state.currentTabIndex == 0
                  ? const Expanded(child: ShoppingListViewBuilderNewWidget())
                  : state.productList.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              TranslationConstants.sorryNoProducts.t(context),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ShoppingListViewBuilderWidget(
                            products: state.productList,
                          ),
                        ),
            if (state is ShoppingTabbedErrorState)
              Expanded(
                child: AppErrorWidget(
                  appErrorType: state.appErrorType,
                  onPressed: () => shoppingTabbedBloc.add(
                    ShoppingTabbedChangedEvent(
                        currentTabIndex: state.currentTabIndex),
                  ),
                ),
              ),
            if (state is ShoppingTabbedLoadingState)
              Expanded(
                child: Center(
                  child: LoadingCircle(size: Sizes.dimen_200.w),
                ),
              ),
          ]),
        );
      },
    );
  }

  _onTapChanged(int currentTab) {
    shoppingTabbedBloc
        .add(ShoppingTabbedChangedEvent(currentTabIndex: currentTab));
  }
}
