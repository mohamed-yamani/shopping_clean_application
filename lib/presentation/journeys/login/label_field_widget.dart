import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  const LabelFieldWidget(
      {Key? key,
      required this.label,
      required this.hintText,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
          ),
          TextField(
            obscureText: obscureText,
            obscuringCharacter: '*',
            controller: controller,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.grey),
              // focusedBorder: _focusedBorder,
              // enabledBorder: _enabledBorder,
            ),
          )
        ],
      ),
    );
  }
}
