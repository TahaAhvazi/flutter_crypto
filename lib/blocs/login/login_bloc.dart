import 'package:bloc/bloc.dart';
import 'package:crfl/services/login_service.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;
  LoginBloc(this.loginService) : super(LoginInitial()) {
    on<OnLoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final token = await loginService.loginUser(
          event.email,
          event.password,
        );
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
