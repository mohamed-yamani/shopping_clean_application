import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/common/constants/languagesConsts.dart';
import 'package:petshop/domain/entites/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
          LanguageLoadedState(
            Locale(LanguagesConsts.languages[1].code),
          ),
        ) {
    on<LanguageToggleEvent>((event, emit) {
      emit(
        LanguageLoadedState(Locale(event.language.code)),
      );
    });
  }
}
