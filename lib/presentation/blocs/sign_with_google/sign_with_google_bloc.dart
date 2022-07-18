import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/usecases/login_with_google.dart';
import 'package:petshop/presentation/blocs/loading/loading_cubit.dart';

part 'sign_with_google_event.dart';
part 'sign_with_google_state.dart';

class SignWithGoogleBloc
    extends Bloc<SignWithGoogleEvent, SignWithGoogleState> {
  final LoadingCubit loadingCubit;
  final LoginWithGoogle loginWithGoogle;
  SignWithGoogleBloc(
      {required this.loadingCubit, required this.loginWithGoogle})
      : super(SignWithGoogleInitial()) {
    on<SignWithGoogleButtonPressed>((event, emit) async {
      loadingCubit.show();
      final result = await loginWithGoogle.call(NoParams());
      loadingCubit.hide();
      result.fold((l) => emit(SignWithGoogleError(appError: l)), (r) {
        print('access token: ${r.accessToken}');
        print('id token: ${r.idToken}');
        print('id: ${r.id}');
        print('nom: ${r.nom}');
        print('photoPrincipal: ${r.photoPrincipal}');
        print('mail: ${r.mail}');
        print('type: ${r.type}');

        emit(SignWithGoogleLoaded(authEntity: r));
      });
    });

    on<SignWithGoogleButtonEvent>((event, emit) async {
      print('LoginBloc: GuestLoginEvent received');
      loadingCubit.show();
      emit(const SignWithGoogleSuccess());
      loadingCubit.hide();
    });
  }
}
