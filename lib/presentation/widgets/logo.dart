import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height})
      : assert(height > 0, 'height must be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      key: const Key('logo_image_key'),
      color: BlocProvider.of<ThemeCubit>(context).state == Themes.dark
          ? Colors.white
          : Colors.black,
      height: height.h * .6,
    );
  }
}
