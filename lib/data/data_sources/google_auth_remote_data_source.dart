import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';

abstract class GoogleAuthRemoteDataSource {
  Future<Either<AppError, AuthEntity>> signInWithGoogleRemoteData();
}

class GoogleAuthRemoteDataSourceImpl implements GoogleAuthRemoteDataSource {
  @override
  Future<Either<AppError, AuthEntity>> signInWithGoogleRemoteData() async {
    final _googleSignIn = GoogleSignIn();
    final account = await _googleSignIn.signIn();
    if (account == null) {
      return left(const AppError(AppErrorType.abortedByUser));
    }
    final googleAuth = await account.authentication;

    return right(AuthEntity(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
      id: account.id,
      nom: account.displayName,
      photoPrincipal: account.photoUrl,
      mail: account.email,
      type: AuthType.google,
    ));
  }
}
