import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/blocs/login/login_bloc.dart';
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
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
            child: Text(
              'Login to pet shop via username or telephone number',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
          LabelFieldWidget(
            label: 'Username',
            hintText: 'Enter your username',
            controller: _userNameController,
          ),
          LabelFieldWidget(
            label: 'Password',
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
          ),
          BlocConsumer<LoginBloc, LoginState>(
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                print('LoginError from LoginForm');

                if (state is LoginError) {
                  return Text(
                    'submit error: ${state.error}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.red,
                        ),
                  );
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is LoginError,
              listener: (context, state) {
                print('LoginSuccess from LoginForm');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteList.home, (route) => false);
              }),
          Button(
            text: TranslationConstants.login,
            isEnabled: enableSignIn,
            onPressed: () {
              print('Login button pressed');
              BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent(
                  username: _userNameController!.text,
                  password: _passwordController!.text));
            },
          )
        ],
      ),
    ));
  }
}
