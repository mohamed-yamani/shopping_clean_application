import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationListItem(
      {Key? key, required this.title, required this.onPressed})
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
        child: ListTile(
          title: Text(title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: Sizes.dimen_25.sp,
                  )),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationSubListItem(
      {Key? key, required this.title, required this.onPressed})
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
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          title: Text(title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: Sizes.dimen_25.sp,
                  )),
        ),
      ),
    );
  }
}
