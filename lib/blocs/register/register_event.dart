part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterButtonPressedEvent extends RegisterEvent {
  final String email;
  final String password;

  const OnRegisterButtonPressedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
