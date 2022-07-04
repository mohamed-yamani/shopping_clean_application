import 'package:bloc/bloc.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/get_preferred_theme.dart';
import 'package:petshop/domain/usecases/update_theme.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({required this.getPreferredTheme, required this.updateTheme})
      : super(Themes.dark);

  void toggleTheme() async {
    await updateTheme(state == Themes.light ? 'dark' : 'light');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final theme = await getPreferredTheme(NoParams());
    emit(theme.fold(
      (l) => Themes.dark,
      (r) => r == 'light' ? Themes.light : Themes.dark,
    ));
  }
}
