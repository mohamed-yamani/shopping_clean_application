part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageToggleEvent extends LanguageEvent {
  final LanguageEntity language;

  const LanguageToggleEvent(this.language);

  @override
  List<Object> get props => [language.code];
}
