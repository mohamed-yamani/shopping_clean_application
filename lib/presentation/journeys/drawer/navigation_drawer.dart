import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/languagesConsts.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/blocs/language/language_bloc.dart';
import 'package:petshop/presentation/blocs/sign_with_google/sign_with_google_bloc.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';
import 'package:petshop/presentation/journeys/drawer/navigation_Expanded_list_item.dart';
import 'package:petshop/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:petshop/presentation/journeys/favorite/favorite_screen.dart';
import 'package:petshop/presentation/themes/theme_color.dart';
import 'package:petshop/presentation/widgets/app_dialog.dart';
import 'package:petshop/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w),
            child: Logo(height: Sizes.dimen_20.h),
          ),
          NavigationListItem(
            title: TranslationConstants.favoriteProducts.t(context),
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.favoriteScreen);
            },
          ),
          NavigationListItem(
            title: TranslationConstants.home.t(context),
            onPressed: () {
              print('Home pressed');
            },
          ),
          NavigationListItem(
            title: TranslationConstants.feedback.t(context),
            onPressed: () {
              Navigator.of(context).pop();
              Wiredash.of(context)?.show();
            },
          ),
          NavigationListItem(
            title: TranslationConstants.about.t(context),
            onPressed: () {
              Navigator.of(context).pop();
              _showAboutDialog(context);
            },
          ),
          NavigationExpandedListItem(
            // title: 'Languagse',
            title: TranslationConstants.language.t(context),
            onPressed: (index) {
              BlocProvider.of<LanguageBloc>(context).add(
                LanguageToggleEvent(LanguagesConsts.languages[index]),
              );
              Navigator.pop(context);
            },
            children: LanguagesConsts.languages.map((e) => e.value).toList(),
          ),
          BlocListener<SignWithGoogleBloc, SignWithGoogleState>(
            listenWhen: (previous, current) => current is SignWithGoogleSuccess,
            listener: (context, state) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(RouteList.initial, (route) => false);
            },
            child: NavigationListItem(
              title: TranslationConstants.logout.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                // BlocProvider.of<SignWithGoogleBloc>(context).add(LogoutEvent());
                // _showLogoutDialog(context);
              },
            ),
          ),
          // toggle theme
          BlocBuilder<ThemeCubit, Themes>(
            builder: (context, theme) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                    icon: Icon(
                        theme == Themes.light
                            ? Icons.brightness_3
                            : Icons.brightness_7,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? Colors.white
                            : AppColor.vulcan)),
              );
            },
          )
        ],
      )),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.okay,
        image: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_32.h,
        ),
      ),
    );
  }
}
