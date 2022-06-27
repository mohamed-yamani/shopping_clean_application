import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:petshop/presentation/journeys/favorite/favorite_product_grid_view.dart';
import 'package:petshop/presentation/themes/theme_color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc? _favoriteBloc;
  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteBloc>();
    _favoriteBloc!.add(LoadFavoriteProductEvent());
  }

  @override
  void dispose() {
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.vulcan,
          title: Text(TranslationConstants.favoriteProducts.t(context)),
        ),
        body: BlocProvider<FavoriteBloc>.value(
            value: _favoriteBloc!,
            child: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteProductsLoadedState) {
                  if (state.fariteProducts.isEmpty) {
                    return Center(
                      child: Text(
                        TranslationConstants.noFavoriteProducts.t(context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  }
                  return FavoriteProductGridView(
                      favoriteProducts: state.fariteProducts);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }
}
