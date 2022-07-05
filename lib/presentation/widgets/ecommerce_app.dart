import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petshop/common/constants/languagesConsts.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/app_localizations.dart';
import 'package:petshop/presentation/blocs/language/language_bloc.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';
import 'package:petshop/presentation/blocs/login/login_bloc.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/fade_page_route_builder.dart';
import 'package:petshop/presentation/journeys/loading/loading_screen.dart';
import 'package:petshop/presentation/routes.dart';
import 'package:petshop/presentation/themes/theme_color.dart';
import 'package:petshop/presentation/themes/theme_text.dart';
import 'package:petshop/presentation/wiredash_app.dart';

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  LanguageBloc? _languageBloc;
  LoginBloc? _loginBloc;
  LoadingCubit? _loadingCubit;
  ThemeCubit? _themeCubit;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _languageBloc = getItInstance<LanguageBloc>();
    _loginBloc = getItInstance<LoginBloc>();
    _loadingCubit = getItInstance<LoadingCubit>();
    _languageBloc?.add(LoadPreferredLanguageEvent());
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit?.loadPreferredTheme();

    super.initState();
  }

  @override
  void dispose() {
    _languageBloc!.close();
    _loginBloc!.close();
    _loadingCubit!.close();
    _themeCubit!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(
          value: _languageBloc!,
        ),
        BlocProvider<LoginBloc>.value(
          value: _loginBloc!,
        ),
        BlocProvider<LoadingCubit>.value(
          value: _loadingCubit!,
        ),
        BlocProvider<ThemeCubit>.value(
          value: _themeCubit!,
        ),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoadedState) {
                return WirdashApp(
                  navigatorKey: _navigatorKey,
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Pet Shop App',
                    theme: ThemeData(
                        brightness: theme == Themes.light
                            ? Brightness.light
                            : Brightness.dark,
                        primaryColor: theme == Themes.dark
                            ? AppColor.vulcan
                            : Colors.white,
                        accentColor: theme == Themes.dark
                            ? AppColor.vulcan
                            : Colors.white,
                        primarySwatch: AppColor.royalBlue as MaterialColor,
                        unselectedWidgetColor: AppColor.royalBlue,
                        scaffoldBackgroundColor: theme == Themes.light
                            ? Colors.white
                            : AppColor.vulcan,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        textTheme: theme == Themes.dark
                            ? ThemeText.getTextTheme()
                            : ThemeText.getLightTextTheme(),
                        appBarTheme: const AppBarTheme(
                          elevation: 0,
                        ),
                        cardTheme: CardTheme(
                          color: theme == Themes.light
                              ? AppColor.vulcan
                              : Colors.white,
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          hintStyle: Theme.of(context).textTheme.graySubtitle1,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: theme == Themes.light
                                ? AppColor.vulcan
                                : Colors.white,
                          )),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                        )),
                    supportedLocales: LanguagesConsts.languages
                        .map((e) => Locale(e.code))
                        .toList(),
                    locale: state.locale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    builder: (context, child) {
                      return LoadingScreen(screen: child!);
                      return child!;
                    },
                    initialRoute: RouteList.initial,
                    onGenerateRoute: (RouteSettings settings) {
                      final routes = Routes.getRoutes(settings);
                      final WidgetBuilder builder = routes[settings.name]!;
                      return FadePageRouteBuilder(
                        builder: builder,
                        settings: settings,
                      );
                    },
                    // home: const HomeScreen(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
