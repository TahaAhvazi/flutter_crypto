import 'package:bloc/bloc.dart';
import 'package:crfl/services/login_service.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginService loginService;
  AuthenticationBloc(this.loginService) : super(AuthenticationInitial()) {
    on<OnAppStartedEvent>((event, emit) async {
      final bool hasToken = await loginService.hasToken();
      if (hasToken) {
        emit(UserAuthenticatedState());
        // ignore: avoid_print
        print(state);
      } else {
        emit(UserUnAuthenticatedState());
        // ignore: avoid_print
        print(state);
      }
    });

    on<OnUserLoggedInEvent>((event, emit) async {
      emit(UserAuthenticatingState());
      await loginService.presistToken(event.token);
      emit(UserAuthenticatedState());
    });

    on<OnUserLoggedOutEvent>((event, emit) async {
      emit(UserAuthenticatingState());
      await loginService.deleteToken();
      emit(UserUnAuthenticatedState());
    });
  }
}
