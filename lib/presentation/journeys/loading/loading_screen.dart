import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';
import 'package:petshop/presentation/journeys/loading/loading_circle.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;
  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, sholdShow) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (sholdShow)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.vulcan.withOpacity(0.5),
                ),
                child: Center(
                  child: LoadingCircle(size: Sizes.dimen_200.w),
                ),
              ),
          ],
        );
      },
    );
  }
}
