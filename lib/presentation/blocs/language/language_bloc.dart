import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/common/constants/languagesConsts.dart';
import 'package:petshop/domain/entites/language_entity.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/get_preferred_language.dart';
import 'package:petshop/domain/usecases/update_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;
  LanguageBloc(
      {required this.getPreferredLanguage, required this.updateLanguage})
      : super(
          LanguageLoadedState(
            Locale(LanguagesConsts.languages[1].code),
          ),
        ) {
    on<LanguageToggleEvent>((event, emit) async {
      await updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
      // emit(
      //   LanguageLoadedState(Locale(event.language.code)),
      // );
    });
    on<LoadPreferredLanguageEvent>((event, emit) async {
      final languageCode = await getPreferredLanguage(NoParams());
      emit(
        languageCode.fold(
          (l) => LanguageLoadedState(Locale(LanguagesConsts.languages[1].code)),
          (r) => LanguageLoadedState(Locale(r)),
        ),
      );
    });
  }
}
