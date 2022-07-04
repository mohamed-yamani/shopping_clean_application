import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class ThemeText {
  ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteTextStyle6 =>
      _poppinsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteTextStyle5 =>
      _poppinsTextTheme.headline5!.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.button!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static TextStyle get whiteButton => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _vulcanHeadline6 =>
      _poppinsTextTheme.headline6!.copyWith(
        color: AppColor.vulcan,
        fontSize: Sizes.dimen_20.sp,
      );

  static TextStyle get _vulcanHeadline5 =>
      _poppinsTextTheme.headline5!.copyWith(
        color: AppColor.vulcan,
        fontSize: Sizes.dimen_24.sp,
      );

  static TextStyle get _vulcanSubtitle1 =>
      _poppinsTextTheme.subtitle1!.copyWith(
        color: AppColor.vulcan,
        fontSize: Sizes.dimen_14.sp,
      );

  static TextStyle get _vulcanBodyText2 =>
      _poppinsTextTheme.bodyText2!.copyWith(
        color: AppColor.vulcan,
        fontSize: Sizes.dimen_14.sp,
      );

  static getTextTheme() => TextTheme(
        headline5: _whiteTextStyle5,
        headline6: _whiteTextStyle6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
        button: whiteButton,
      );

  static getLightTextTheme() => TextTheme(
        headline5: _vulcanHeadline5,
        headline6: _vulcanHeadline6,
        subtitle1: _vulcanSubtitle1,
        bodyText2: _vulcanBodyText2,
        button: whiteButton,
      );
}

extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1!.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get graySubtitle1 => subtitle1!.copyWith(
        color: Colors.grey,
      );

  TextStyle get violetHeadline6 => headline6!.copyWith(
        color: AppColor.violet,
      );

  TextStyle get violetBodyText2 => headline6!.copyWith(
        color: AppColor.violet,
        fontWeight: FontWeight.w600,
      );

  TextStyle get grayCaption => caption!.copyWith(
        color: Colors.grey,
      );
}
