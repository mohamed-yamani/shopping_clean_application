import 'package:equatable/equatable.dart';

class AuthFailure extends Equatable {
  final AuthFailureType appErrorType;

  const AuthFailure(this.appErrorType);

  @override
  List<Object> get props => [appErrorType];
}

enum AuthFailureType {
  server,
  storage,
  network,
  abortedByUser,
  wrongCode,
  expiredCode,
  unauthorized,
  emailExists,
  phoneTaken
}
