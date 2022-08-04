part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UserLoadingState extends UsersState {}

class UserLoadedState extends UsersState {
  final List<Datum> users;

  const UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserLoadingFaildState extends UsersState {}
