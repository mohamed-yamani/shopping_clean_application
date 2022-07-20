part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignIGetConvertTokenEvent extends SignInEvent {
  final String clientId;
  final String clientSecret;
  final String backend;
  final String refreshToken;
  final String grantType;

  const SignIGetConvertTokenEvent(
      {required this.clientId,
      required this.clientSecret,
      required this.backend,
      required this.refreshToken,
      required this.grantType});

  @override
  List<Object> get props =>
      [clientId, clientSecret, backend, refreshToken, grantType];
}

class LoginGuestButtonEvent extends SignInEvent {}

class SignInWithGoogleButtonPressed extends SignInEvent {}

class SignInWithAppleButtonPressed extends SignInEvent {}

class SignInWithFacebookButtonPressed extends SignInEvent {}

class CheckIfsessionExistsEvent extends SignInEvent {}

class LogOutButtonPressed extends SignInEvent {}
