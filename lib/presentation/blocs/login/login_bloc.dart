import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/login_request_params.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/login_user.dart';
import 'package:petshop/domain/usecases/logout_user.dart';
import 'package:petshop/presentation/blocs/loading/loading_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingBloc loadingBloc;

  LoginBloc(this.logoutUser,
      {required this.loadingBloc, required this.loginUser})
      : super(LoginInitial()) {
    on<LoginInitialEvent>((event, emit) async {
      print(
          'LoginBloc: LoginInitialEvent received with username: ${event.username} and password: ${event.password}');
      loadingBloc.add(StartLoadingEvent());
      final Either<AppError, bool> eitherReponse =
          await loginUser(LoginRequestParams(
        username: event.username,
        password: event.password,
      ));
      eitherReponse.fold(
          (l) => emit(LoginError(getErrorMessage(l.appErrorType))),
          (r) => LoginSuccess());
      loadingBloc.add(StopLoadingEvent());
    });
    on<LogoutEvent>((event, emit) async {
      print('LoginBloc: LogoutEvent received');
      loadingBloc.add(StartLoadingEvent());
      final Either<AppError, void> eitherReponse = await logoutUser(NoParams());
      eitherReponse.fold(
          (l) => emit(LoginError(getErrorMessage(l.appErrorType))),
          (r) => LoginInitial());
      loadingBloc.add(StopLoadingEvent());
    });
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.api:
      case AppErrorType.database:
        return 'Something went wrong';
      case AppErrorType.network:
        return 'Network error';
      case AppErrorType.unauthorized:
        return 'Unauthorized';
      case AppErrorType.sessionDenied:
        return 'Session denied';
      default:
        return 'username or password is incorrect';
    }
  }
}
