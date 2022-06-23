import 'package:petshop/domain/entites/language_entity.dart';

class LanguagesConsts {
  const LanguagesConsts._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'fr', value: 'Français'),
    LanguageEntity(code: 'ar', value: 'العربية'),
  ];
}
