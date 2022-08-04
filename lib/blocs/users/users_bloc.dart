import 'package:bloc/bloc.dart';
import 'package:crfl/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersService getUsersService;
  UsersBloc(this.getUsersService) : super(UsersInitial()) {
    on<UsersListFetchedEvent>((event, emit) async {
      emit(UserLoadingState());
      final usersList = await getUsersService.getUserList();
      emit(UserLoadedState(usersList));
    });
  }
}
