part of 'sign_with_google_bloc.dart';

abstract class SignWithGoogleState extends Equatable {
  const SignWithGoogleState();

  @override
  List<Object> get props => [];
}

class SignWithGoogleInitial extends SignWithGoogleState {}

class SignWithGoogleLoading extends SignWithGoogleState {}

class SignWithGoogleLoaded extends SignWithGoogleState {
  final AuthEntity authEntity;

  const SignWithGoogleLoaded({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class SignWithGoogleError extends SignWithGoogleState {
  final AppError appError;

  const SignWithGoogleError({required this.appError});

  @override
  List<Object> get props => [appError];
}

class SignWithGoogleSuccess extends SignWithGoogleState {
  const SignWithGoogleSuccess();

  @override
  List<Object> get props => [];
}
