import 'dart:async';

import 'package:hive/hive.dart';

abstract class ThemeLocalDataSource {
  Future<void> updateTheme(String theme);
  Future<String> getPreferredTheme();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  @override
  Future<String> getPreferredTheme() async {
    late final Box productBox;
    if (Hive.isBoxOpen('themeBox')) {
      productBox = Hive.box('themeBox');
    } else {
      productBox = await Hive.openBox('themeBox');
    }
    return productBox.get('preferred_theme');
  }

  @override
  Future<void> updateTheme(String theme) async {
    late final Box productBox;
    if (Hive.isBoxOpen('themeBox')) {
      productBox = Hive.box('themeBox');
    } else {
      productBox = await Hive.openBox('themeBox');
    }
    unawaited(productBox.put('preferred_theme', theme));
  }
}
