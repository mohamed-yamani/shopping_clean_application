import 'package:flutter/material.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class ThemeText {
  ThemeText._();

  static TextTheme get _poppinsTextTheme => const TextTheme(
        headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 8.0, fontFamily: 'Hind'),
        bodyText1: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        caption: TextStyle(fontSize: 10.0, fontFamily: 'Hind'),
        subtitle1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        subtitle2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        headline2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        headline3: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        headline4: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        headline5: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      );
  static TextStyle get _whiteTextStyle6 =>
      _poppinsTextTheme.headline6 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get _whiteTextStyle5 =>
      _poppinsTextTheme.headline5 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get whiteSubtitle1 =>
      _poppinsTextTheme.subtitle1 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get whiteButton =>
      _poppinsTextTheme.button ?? const TextStyle(fontSize: 14.0);

  static TextStyle get whiteBodyText2 =>
      _poppinsTextTheme.bodyText2 ?? const TextStyle(fontSize: 8.0);

  static TextStyle get _vulcanHeadline6 =>
      _poppinsTextTheme.headline6 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get _vulcanHeadline5 =>
      _poppinsTextTheme.headline5 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get _vulcanSubtitle1 =>
      _poppinsTextTheme.subtitle1 ?? const TextStyle(fontSize: 14.0);

  static TextStyle get _vulcanBodyText2 =>
      _poppinsTextTheme.bodyText2 ?? const TextStyle(fontSize: 8.0);

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
  TextStyle get royalBlueSubtitle1 => subtitle1!;

  TextStyle get graySubtitle1 => subtitle1!;
  TextStyle get violetHeadline6 => headline6!;

  TextStyle get violetBodyText2 => headline6!;

  TextStyle get grayCaption => caption!;
}
