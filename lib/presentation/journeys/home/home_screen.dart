import 'package:flutter/material.dart';
import 'package:petshop/common/constants/route_constants.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/presentation/blocs/nouvelle_collection/nouvelle_collection_bloc.dart';
import 'package:petshop/presentation/blocs/serach_product/serach_product_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_tabbed/shopping_tabbed_bloc.dart';
import 'package:petshop/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:petshop/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:petshop/presentation/widgets/app_error_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_carousel/shopping_carousel_widget.dart';
import 'package:petshop/presentation/journeys/home/shopping_tabbed/shopping_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselBloc? carouselBloc;
  ShoppingBackdropBloc? shoppingBackdropBloc;
  ShoppingTabbedBloc? shoppingTabbedBloc;
  SerachProductBloc? serachProductBloc;
  NouvelleCollectionBloc? nouvelleCollectionBloc;

  @override
  void initState() {
    super.initState();
    carouselBloc = getItInstance<CarouselBloc>();
    shoppingBackdropBloc = carouselBloc!.shoppingBackdropBloc;
    shoppingTabbedBloc = getItInstance<ShoppingTabbedBloc>();
    serachProductBloc = getItInstance<SerachProductBloc>();
    nouvelleCollectionBloc = getItInstance<NouvelleCollectionBloc>();
    carouselBloc?.add(const CarouselLoadEvent());
    nouvelleCollectionBloc!.add(const NouvelleCollectionLoadEvent(id: 2));
  }

  @override
  void dispose() {
    super.dispose();
    carouselBloc!.close();
    shoppingBackdropBloc!.close();
    serachProductBloc!.close();
    shoppingTabbedBloc!.close();
    nouvelleCollectionBloc!.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => carouselBloc!),
        BlocProvider(create: (context) => shoppingBackdropBloc!),
        BlocProvider(create: (context) => shoppingTabbedBloc!),
        BlocProvider(create: (context) => serachProductBloc!),
        BlocProvider(create: (context) => nouvelleCollectionBloc!),
      ],
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is IsNotSignIn) {
            Navigator.of(context).pushReplacementNamed(
              RouteList.initial,
            );
          }
        },
        child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<CarouselBloc, CarouselState>(
            bloc: carouselBloc!,
            builder: (context, state) {
              if (state is CarouselLoadedState) {
                return Stack(fit: StackFit.expand, children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: ShoppingCarouselWidget(
                      menuList: state.menuList,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: ShoppingTabbedWidget()),
                ]);
              } else if (state is CarouselErrorState) {
                return AppErrorWidget(
                  appErrorType: state.appErrorType,
                  onPressed: () => carouselBloc!.add(const CarouselLoadEvent()),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
