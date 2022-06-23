import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/journeys/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> children;

  const NavigationExpandedListItem(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onPressed()),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              blurRadius: 2,
            ),
          ],
        ),
        child: ExpansionTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: Sizes.dimen_25.sp,
                  ),
            ),
            children: [
              for (int index = 0; index < children.length; index++)
                NavigationSubListItem(
                  title: children[index],
                  onPressed: () => onPressed(index),
                ),
            ]),
      ),
    );
  }
}
