part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnAppStartedEvent extends AuthenticationEvent {}

class OnUserLoggedInEvent extends AuthenticationEvent {
  final String token;
  const OnUserLoggedInEvent(this.token);
  @override
  List<Object> get props => [token];
}

class OnUserLoggedOutEvent extends AuthenticationEvent {}
