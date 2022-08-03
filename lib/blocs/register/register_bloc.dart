import 'package:bloc/bloc.dart';
import 'package:crfl/services/register_service.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterService registerService;
  RegisterBloc(this.registerService) : super(RegisterInitial()) {
    on<OnRegisterButtonPressedEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        final token = await registerService.registerUser(
          event.email,
          event.password,
        );
        emit(RegisterSuccessState());
        // ignore: avoid_print
        print(state);
      } catch (error) {
        emit(RegisterLoadingState());
        emit(RegisterFailureState(error.toString()));
        // ignore: avoid_print
        print(state);
      }
    });
  }
}
