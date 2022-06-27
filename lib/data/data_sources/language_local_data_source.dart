import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String language);
  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    late final Box productBox;
    if (Hive.isBoxOpen('languageBox')) {
      productBox = Hive.box('languageBox');
    } else {
      productBox = await Hive.openBox('languageBox');
    }
    return productBox.get('preferred_language');
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    late final Box productBox;
    if (Hive.isBoxOpen('languageBox')) {
      productBox = Hive.box('languageBox');
    } else {
      productBox = await Hive.openBox('languageBox');
    }
    unawaited(productBox.put('preferred_language', languageCode));
  }
}
