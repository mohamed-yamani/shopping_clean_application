import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';

class ShoppingDataWedget extends StatelessWidget {
  const ShoppingDataWedget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBackdropBloc, ShoppingBackdropState>(
      builder: (context, state) {
        if (state is ShoppingBackdropChangedState) {
          return Text(
            state.menu.nom!.capitalize(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headline6,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
