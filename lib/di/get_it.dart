import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/data_sources/authentication_local_data_source.dart';
import 'package:petshop/data/data_sources/authentication_remote_data_source.dart';
import 'package:petshop/data/data_sources/convert_token_remote_data_source.dart';
import 'package:petshop/data/data_sources/google_auth_remote_data_source.dart';
import 'package:petshop/data/data_sources/language_local_data_source.dart';
import 'package:petshop/data/data_sources/menu_remote_data_source.dart';
import 'package:petshop/data/data_sources/nouvelle_collection_remote_data_source.dart';
import 'package:petshop/data/data_sources/product_local_data_source.dart';
import 'package:petshop/data/data_sources/product_remote_data_source.dart';
import 'package:petshop/data/data_sources/sign_in_local_data_source.dart';
import 'package:petshop/data/data_sources/sub_category_remote_data_source.dart';
import 'package:petshop/data/data_sources/theme_local_data_source.dart';
import 'package:petshop/data/repositories/app_repository_impl.dart';
import 'package:petshop/data/repositories/auth_repository_impl.dart';
import 'package:petshop/data/repositories/authenticationRepositoryImpl.dart';
import 'package:petshop/data/repositories/menu_repository_impl.dart';
import 'package:petshop/data/repositories/nouvelle_collection_repository_impl.dart';
import 'package:petshop/data/repositories/product_repository_impl.dart';
import 'package:petshop/data/repositories/sub_category_repository_impl.dart';
import 'package:petshop/domain/repositories/app_repository.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/repositories/menu_repositories.dart';
import 'package:petshop/domain/repositories/nouvelle_collection_repository.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/repositories/sub_category_repository.dart';
import 'package:petshop/domain/usecases/check_if_product_favorite.dart';
import 'package:petshop/domain/usecases/check_if_session_exists_usecase.dart';
import 'package:petshop/domain/usecases/delete_favorite_products.dart';
import 'package:petshop/domain/usecases/delete_session_usecase.dart';
import 'package:petshop/domain/usecases/get_convert_token.dart';
import 'package:petshop/domain/usecases/get_favorite_products.dart';
import 'package:petshop/domain/usecases/get_menu.dart';
import 'package:petshop/domain/usecases/get_new_products.dart';
import 'package:petshop/domain/usecases/get_nouvelle_collection.dart';
import 'package:petshop/domain/usecases/get_photo_product_color.dart';
import 'package:petshop/domain/usecases/get_popular_products.dart';
import 'package:petshop/domain/usecases/get_preferred_language.dart';
import 'package:petshop/domain/usecases/get_preferred_theme.dart';
import 'package:petshop/domain/usecases/get_product_by_category.dart';
import 'package:petshop/domain/usecases/get_product_details.dart';
import 'package:petshop/domain/usecases/get_products.dart';
import 'package:petshop/domain/usecases/get_promotion_products.dart';
import 'package:petshop/domain/usecases/get_session_usecase.dart';
import 'package:petshop/domain/usecases/get_sub_categories.dart';
import 'package:petshop/domain/usecases/login_user.dart';
import 'package:petshop/domain/usecases/login_with_google.dart';
import 'package:petshop/domain/usecases/logout_user.dart';
import 'package:petshop/domain/usecases/save_new_session_use_case.dart';
import 'package:petshop/domain/usecases/save_product.dart';
import 'package:petshop/domain/usecases/search_products.dart';
import 'package:petshop/domain/usecases/update_language.dart';
import 'package:petshop/domain/usecases/update_theme.dart';
import 'package:petshop/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:petshop/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:petshop/presentation/blocs/language/language_bloc.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';
import 'package:petshop/presentation/blocs/nouvelle_collection/nouvelle_collection_bloc.dart';
import 'package:petshop/presentation/blocs/photo_product_color/photo_product_color_bloc.dart';
import 'package:petshop/presentation/blocs/product_by_category/product_by_category_bloc.dart';
import 'package:petshop/presentation/blocs/product_details/product_details_bloc.dart';
import 'package:petshop/presentation/blocs/serach_product/serach_product_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_backdrop/shopping_backdrop_bloc.dart';
import 'package:petshop/presentation/blocs/shopping_tabbed/shopping_tabbed_bloc.dart';
import 'package:petshop/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';
import 'package:petshop/presentation/blocs/theme/theme_cubit.dart';

import '../domain/repositories/authentication_repository.dart';

final getItInstance = GetIt.I;

Future init() async {
  //! Client Http instance
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  //! Products Repository (Remote Data Source)
  getItInstance.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getItInstance()));
  //! Products Repository (Local Data Source)
  getItInstance.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());
  //! Session Local Data Source
  getItInstance.registerLazySingleton<SessionLocalDataSource>(
      () => SessionLocalDataSourceImpl());
  //! Nouvelle Collection Repository (Remote Data Source)
  getItInstance.registerLazySingleton<NouvelleCollectionRemoteDataSource>(
      () => NouvelleCollectionRemoteDataSourceImpl(getItInstance()));
  //! convert token (Remote Data Source)
  getItInstance.registerLazySingleton<ConvertTokenRemoteDataSource>(
      () => ConvertTokenRemoteDataSourceImpl(getItInstance()));

  //! Language Local Data Source
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance
      .registerLazySingleton<GetProducts>(() => GetProducts(getItInstance()));
  getItInstance.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<ProductRepositoryImpl>(
      () => ProductRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<ProductRemoteDataSourceImpl>(
      () => ProductRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImpl());
  getItInstance.registerLazySingleton<SubCategoryRepository>(
      () => SubCategoryRepositoryImpl(getItInstance()));

  //! Nouvelle Collection Repository
  getItInstance.registerLazySingleton<NouvelleCollectionRepository>(
      () => NouvelleCollectionRepositoryImpl(getItInstance()));
  // ! Authentication Repository
  getItInstance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        googleAuthRemoteDataSource: getItInstance(),
        convertTokenRemoteDataSource: getItInstance(),
        signInLocalDataSource: getItInstance(),
      ));
  //! Nouvelle Collection usecase
  getItInstance.registerLazySingleton<GetNouvelleCollection>(
      () => GetNouvelleCollection(getItInstance()));
  //! save new session usecase
  getItInstance.registerLazySingleton<SaveNewSessionUseCase>(
      () => SaveNewSessionUseCase(repository: getItInstance()));
  //! get session usecase
  getItInstance.registerLazySingleton<GetSessionUseCase>(
      () => GetSessionUseCase(repository: getItInstance()));
  //! delete session usecase
  getItInstance.registerLazySingleton<DeleteSessionUsecase>(
      () => DeleteSessionUsecase(authRepository: getItInstance()));
  //! check if session exists usecase
  getItInstance.registerLazySingleton<CheckIFSessionExistsUsecase>(
      () => CheckIFSessionExistsUsecase(authRepository: getItInstance()));

  //! Application Repository (Local Data Source)
  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getItInstance(), getItInstance()),
  );
  //! Authentication Repository (Remote Data Source) AuthenticationRemoteDataSource
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));
  //! GoogleAuthRemoteDataSource (Remote Data Source)
  getItInstance.registerLazySingleton<GoogleAuthRemoteDataSource>(
      () => GoogleAuthRemoteDataSourceImpl());
  //! Authentication Repository (Local Data Source) AuthenticationLocalDataSource
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  //! login Repository (Remote Data Source)
  getItInstance.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );
  //! SubCategoryRemoteDataSource  (Remote Data Source)
  getItInstance.registerLazySingleton<SubCategoryRemoteDataSource>(
      () => SubCategoryRemoteDataSourceImpl(getItInstance()));
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
  //! get Product By Category Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetProductByCategory>(
      () => GetProductByCategory(getItInstance()));
  //! login With Google usecase
  getItInstance.registerLazySingleton<LoginWithGoogle>(
      () => LoginWithGoogle(getItInstance()));
  //! sub Categories Repository (Remote Data Source)
  getItInstance.registerLazySingleton<GetSubCatogeries>(
    () => GetSubCatogeries(getItInstance()),
  );
  //! save product as favorite Repository (Local Data Source)
  getItInstance
      .registerLazySingleton<SaveProduct>(() => SaveProduct(getItInstance()));
  //! get photo color product
  getItInstance.registerLazySingleton<GetPhotoProductColor>(
      () => GetPhotoProductColor(getItInstance()));

  //! GetFavoriteProducts Repository (Local Data Source)
  getItInstance.registerLazySingleton<GetFavoriteProducts>(
      () => GetFavoriteProducts(getItInstance()));

  //! DeleteFavoriteProduct Repository (Local Data Source)
  getItInstance.registerLazySingleton<DeleteFavoriteProduct>(
      () => DeleteFavoriteProduct(getItInstance()));
  //! CheckIfProductFavorite Repository (Local Data Source)
  getItInstance.registerLazySingleton<CheckIfProductFavorite>(
      () => CheckIfProductFavorite(getItInstance()));
  // ! get convert token usecase
  getItInstance.registerLazySingleton<GetConvertToken>(
      () => GetConvertToken(getItInstance()));
  //! update language and get preferred use case
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));
  //! update theme and get preferred use case
  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));
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
  getItInstance.registerLazySingleton<SubCategoryRepositoryImpl>(
      () => SubCategoryRepositoryImpl(getItInstance()));

  //! factorys for shopping backdrop bloc
  getItInstance.registerFactory(() => ShoppingBackdropBloc());

  //! factorys for carousel bloc
  getItInstance.registerFactory(
    () => CarouselBloc(
      loadingCubit: getItInstance(),
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

  //! factorys for product details bloc
  getItInstance.registerFactory(
    () => ProductDetailsBloc(
      loadingCubit: getItInstance(),
      getProductDetails: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );

  //! factorys for product by sub category bloc
  getItInstance.registerFactory(
    () => ProductByCategoryBloc(
      loadingCubit: getItInstance(),
      getProductByCategory: getItInstance(),
    ),
  );

  //! factorys for SubCategory bloc

  getItInstance.registerFactory(
    () => SubCategoriesBloc(
      loadingCubit: getItInstance(),
      getSubCategories: getItInstance(),
    ),
  );

  //! factorys for nouvelle collection bloc
  getItInstance.registerFactory(
    () => NouvelleCollectionBloc(
      getNouvelleCollection: getItInstance(),
      loadingCubit: getItInstance(),
    ),
  );

  //! factorys for photo product color bloc
  getItInstance.registerFactory(
    () => PhotoProductColorBloc(
      loadingCubit: getItInstance(),
      getPhotoProductColor: getItInstance(),
    ),
  );

  //! languages bloc
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
      getPreferredLanguage: getItInstance(), updateLanguage: getItInstance()));

  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
      getPreferredTheme: getItInstance(), updateTheme: getItInstance()));

  //! Login
  //! login use case
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
  //! logout use case
  getItInstance
      .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  //! SignInBloc bloc
  getItInstance.registerFactory(() => SignInBloc(
        loadingCubit: getItInstance(),
        getConvertToken: getItInstance(),
        loginWithGoogle: getItInstance(),
        checkIFSessionExistsUsecase: getItInstance(),
        deleteSessionUsecase: getItInstance(),
        getSessionUseCase: getItInstance(),
        saveNewSessionUseCase: getItInstance(),
      ));

  //! search product and search product bloc
  getItInstance.registerLazySingleton<SearchProducts>(
      () => SearchProducts(getItInstance()));
  getItInstance.registerFactory<SerachProductBloc>(() => SerachProductBloc(
      loadingCubit: getItInstance(), searchProducts: getItInstance()));
  //! favorite product bloc
  getItInstance.registerFactory<FavoriteBloc>(() => FavoriteBloc(
      saveProduct: getItInstance(),
      getFavoriteProducts: getItInstance(),
      deleteFavoriteProduct: getItInstance(),
      checkIfProductFavorite: getItInstance()));
  //! loading bloc

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
