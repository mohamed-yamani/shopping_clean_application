import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/data_sources/menu_remote_data_source.dart';
import 'package:petshop/data/data_sources/product_remote_data_source.dart';
import 'package:petshop/data/repositories/menu_repository_impl.dart';
import 'package:petshop/data/repositories/product_repository_impl.dart';
import 'package:petshop/domain/repositories/menu_repositories.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/get_menu.dart';
import 'package:petshop/domain/usecases/get_new_products.dart';
import 'package:petshop/domain/usecases/get_popular_products.dart';
import 'package:petshop/domain/usecases/get_product_details.dart';
import 'package:petshop/domain/usecases/get_products.dart';
import 'package:petshop/domain/usecases/get_promotion_products.dart';
import 'package:petshop/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:petshop/presentation/blocs/language/language_bloc.dart';
import 'package:petshop/presentation/blocs/product_details/product_details_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_tabbed/shopping_tabbed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  //! Client Http instance
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  //! Products Repository (Remote Data Source)
  getItInstance.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetProducts>(() => GetProducts(getItInstance()));
  getItInstance.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<ProductRepositoryImpl>(
      () => ProductRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<ProductRemoteDataSourceImpl>(
      () => ProductRemoteDataSourceImpl(getItInstance()));
  //! Popular Products Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetPopularProducts>(
      () => GetPopularProducts(getItInstance()));
  //! Promotion Products Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetPromotionProducts>(
      () => GetPromotionProducts(getItInstance()));
  //! New Products Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetNewProducts>(
      () => GetNewProducts(getItInstance()));
  //! Product Detail Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetProductDetails>(
      () => GetProductDetails(getItInstance()));
  //! Menu Repository (Remote Data Source)
  getItInstance.registerLazySingleton<MenuRemoteDataSource>(
      () => MenuRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MenuRemoteDataSourceImpl>(
      () => MenuRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetMenu>(() => GetMenu(getItInstance()));
  getItInstance.registerLazySingleton<MenuRepository>(
      () => MenuRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<MenuRepositoryImpl>(
      () => MenuRepositoryImpl(getItInstance()));

  //! factorys for shopping backdrop bloc
  getItInstance.registerFactory(() => ShoppingBackdropBloc());

  //! factorys for carousel bloc
  getItInstance.registerFactory(
    () => CarouselBloc(
      getMenu: getItInstance(),
      shoppingBackdropBloc: getItInstance(),
    ),
  );
  //! shopping tabbed bloc
  getItInstance.registerFactory(
    () => ShoppingTabbedBloc(
      getNewProducts: getItInstance(),
      getPromotionProducts: getItInstance(),
      getPopularProducts: getItInstance(),
    ),
  );

  //! factorys for language bloc
  getItInstance.registerFactory(
    () => ProductDetailsBloc(
      getProductDetails: getItInstance(),
    ),
  );

  //! languages bloc
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
