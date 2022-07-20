part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final ConvertTokenEntity convertTokenData;

  const SignInSuccess({required this.convertTokenData});

  @override
  List<Object> get props => [convertTokenData];
}

class SignInError extends SignInState {
  final AppError appError;

  const SignInError({required this.appError});

  @override
  List<Object> get props => [appError];
}

class GuestLoginState extends SignInState {}

class SignInWithGoogleSuccess extends SignInState {
  const SignInWithGoogleSuccess();

  @override
  List<Object> get props => [];
}

class IsSignIn extends SignInState {}

class IsNotSignIn extends SignInState {}

class LogoutState extends SignInState {}
