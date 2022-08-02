import 'package:bloc/bloc.dart';
import 'package:crfl/blocs/authentication/authentication_bloc.dart';
import 'package:crfl/services/login_service.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;
  final AuthenticationBloc authenticationBloc;
  LoginBloc(this.loginService, this.authenticationBloc)
      : super(LoginInitial()) {
    on<OnLoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final token = await loginService.loginUser(
          event.email,
          event.password,
        );
        authenticationBloc.add(OnUserLoggedInEvent(token));
        emit(LoginSuccessState());
        // ignore: avoid_print
        print(state);
      } catch (error) {
        emit(LoginFailureState(error: error.toString()));
        // ignore: avoid_print
        print(state);
      }
    });
  }
}
