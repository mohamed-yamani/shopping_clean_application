import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';
import 'package:petshop/domain/entites/convert_token_params.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/check_if_session_exists_usecase.dart';
import 'package:petshop/domain/usecases/delete_session_usecase.dart';
import 'package:petshop/domain/usecases/get_convert_token.dart';
import 'package:petshop/domain/usecases/get_session_usecase.dart';
import 'package:petshop/domain/usecases/login_with_google.dart';
import 'package:petshop/domain/usecases/save_new_session_use_case.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

String globalClientId = 'RLH04klrRXYgK2jBqmaWk3ekPrbAU69gkMs8V662';
String globalClientSecret =
    'zVJsS9QSpoB37Fws1Eyp1kYxyZgQeBfZnuAHZnnFReWlupk0ZxOKKNeEY5JIUf5nKZgMTewj3EZ4pZnAwtS3Tg8y7SuFv6brTHIkxOIrsODxKFqUi1WZv6zEOMXWyYHv';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GetConvertToken getConvertToken;
  final SaveNewSessionUseCase saveNewSessionUseCase;
  final GetSessionUseCase getSessionUseCase;
  final DeleteSessionUsecase deleteSessionUsecase;
  final CheckIFSessionExistsUsecase checkIFSessionExistsUsecase;
  final LoadingCubit loadingCubit;
  final LoginWithGoogle loginWithGoogle;
  SignInBloc(
      {required this.getConvertToken,
      required this.loadingCubit,
      required this.loginWithGoogle,
      required this.saveNewSessionUseCase,
      required this.getSessionUseCase,
      required this.deleteSessionUsecase,
      required this.checkIFSessionExistsUsecase})
      : super(SignInInitial()) {
    on<LoginGuestButtonEvent>((event, emit) {
      loadingCubit.show();
      emit(GuestLoginState());
      loadingCubit.hide();
    });
    on<SignInWithGoogleButtonPressed>((event, emit) async {
      loadingCubit.show();
      final result = await loginWithGoogle.call(NoParams());

      result.fold(
          (l) => emit(SignInError(appError: l)),
          (r) => {
                add(
                  SignIGetConvertTokenEvent(
                      clientId: globalClientId,
                      clientSecret: globalClientSecret,
                      backend: 'google-oauth2',
                      refreshToken: r.accessToken!,
                      grantType: 'convert_token'),
                ),
              });
      loadingCubit.hide();
    });
    on<CheckIfsessionExistsEvent>(((event, emit) async {
      print('you checked if es already signed');

      loadingCubit.show();
      final result = await checkIFSessionExistsUsecase.call(NoParams());
      print('result is $result');
      result.fold(
        (l) => {print('error'), emit(SignInError(appError: l))},
        (r) => {
          print('success'),
          if (r) emit(IsSignIn()) else emit(IsNotSignIn())
        },
      );
      // emit(CheckIfsessionExistsState()),
      loadingCubit.hide();
    }));
    on<LogOutButtonPressed>((event, emit) async {
      loadingCubit.show();
      final result = await deleteSessionUsecase.call(NoParams());
      result.fold(
          (l) => emit(SignInError(appError: l)), (r) => emit(LogoutState()));
      loadingCubit.hide();
    });
    on<SignIGetConvertTokenEvent>((event, emit) async {
      loadingCubit.show();
      final result = await getConvertToken.call(ConvertTokenParams(
          clientId: event.clientId,
          clientSecret: event.clientSecret,
          backend: event.backend,
          refreshToken: event.refreshToken,
          grantType: event.grantType));
      result.fold(
        (l) => emit(SignInError(appError: l)),
        (r) => {
          emit(SignInSuccess(convertTokenData: r)),
          saveNewSessionUseCase.call(
            ConvertTokenEntity(
                accessToken: r.accessToken,
                refreshToken: r.refreshToken,
                expiresIn: r.expiresIn,
                tokenType: r.tokenType,
                scope: r.scope),
          ),
        },
      );
      loadingCubit.hide();
    });
  }
}
