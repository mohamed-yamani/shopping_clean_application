import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/app_localizations.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class TabTitleWedget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWedget(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ),
          ),
        ),
        child: Text(
          title.t(context),
          style: isSelected
              ? Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: AppColor.royalBlue,
                    fontWeight: FontWeight.w600,
                  )
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
