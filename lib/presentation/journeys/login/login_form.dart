import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:petshop/presentation/journeys/login/label_field_widget.dart';
import 'package:petshop/presentation/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController?.addListener(() {
      setState(() {
        enableSignIn = _userNameController!.text.isNotEmpty &&
            _passwordController!.text.isNotEmpty;
      });
    });
    _passwordController?.addListener(() {
      setState(() {
        enableSignIn = _userNameController!.text.isNotEmpty &&
            _passwordController!.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _userNameController?.clear();
    _passwordController?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_32.w,
        vertical: Sizes.dimen_24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocConsumer<SignInBloc, SignInState>(
              buildWhen: (previous, current) => current is SignInError,
              builder: (context, state) {
                if (state is SignInError) {
                  return Text(
                    'submit error: ${state.appError}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.red,
                        ),
                  );
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) =>
                  current is GuestLoginState ||
                  current is SignInSuccess ||
                  current is IsSignIn,
              listener: (context, state) {
                if (state is GuestLoginState) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteList.home, (route) => false);
                } else if (state is SignInSuccess) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteList.home, (route) => false);
                }
              }),
          Button(
            text: TranslationConstants.siginInWithGoogle,
            isEnabled: enableSignIn,
            onPressed: () {
              print('Login button pressed');
              BlocProvider.of<SignInBloc>(context).add(
                SignInWithGoogleButtonPressed(),
              );
            },
          ),

          // login with apple button
          Button(
            text: TranslationConstants.signInWithApple,
            isEnabled: enableSignIn,
            onPressed: () {
              print('Login button pressed');
              BlocProvider.of<SignInBloc>(context).add(
                SignInWithAppleButtonPressed(),
              );
            },
          ),

          // login with facebook button

          Button(
            text: TranslationConstants.signInWithFacebook,
            isEnabled: enableSignIn,
            onPressed: () {
              print('Login button pressed');
              BlocProvider.of<SignInBloc>(context).add(
                SignInWithFacebookButtonPressed(),
              );
            },
          ),

          Button(
              text: TranslationConstants.guestLogin,
              onPressed: () => BlocProvider.of<SignInBloc>(context)
                  .add(LoginGuestButtonEvent())),
        ],
      ),
    ));
  }
}
