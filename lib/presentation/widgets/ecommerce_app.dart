import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petshop/common/constants/languagesConsts.dart';
import 'package:petshop/common/screenutil/screenutil.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/app_localizations.dart';
import 'package:petshop/presentation/blocs/language/language_bloc.dart';
import 'package:petshop/presentation/journeys/home/home_screen.dart';
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
  @override
  void initState() {
    _languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _languageBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc!,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoadedState) {
            return WirdashApp(
              navigatorKey: _navigatorKey,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Pet Shop App',
                theme: ThemeData(
                    primaryColor: AppColor.vulcan,
                    primarySwatch: AppColor.royalBlue as MaterialColor,
                    unselectedWidgetColor: AppColor.royalBlue,
                    scaffoldBackgroundColor: AppColor.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(
                      elevation: 0,
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
                home: const HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
