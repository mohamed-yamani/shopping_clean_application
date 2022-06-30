import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isEnabled;

  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isEnabled
            ? LinearGradient(
                colors: [
                  AppColor.violet,
                  AppColor.violet.withOpacity(0.5),
                ],
              )
            : const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
              ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_14.w,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_12.h,
      ),
      height: Sizes.dimen_18.h,
      child: OutlinedButton(
        onPressed: () => onPressed(),
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
