import 'package:crfl/blocs/users/users_bloc.dart';
import 'package:crfl/routes/user_detail.dart';
import 'package:crfl/services/user_service.dart';
import 'package:crfl/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
      create: (context) => GetUsersService(),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              UsersBloc(RepositoryProvider.of<GetUsersService>(context))
                ..add(UsersListFetchedEvent()),
          child: SizedBox(
            height: height,
            width: width,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UserLoadedState) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 10 / 100),
                    child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserDetail(
                                username: state.users[index].firstName,
                                id: state.users[index].id,
                                avatar: state.users[index].avatar,
                                email: state.users[index].email,
                                lastName: state.users[index].lastName,
                              ),
                            ));
                          },
                          child: UserItem(
                            avatar: state.users[index].avatar,
                            username: state.users[index].firstName,
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is UserLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserLoadingFaildState) {
                  return const Center(
                    child: Text("Eror"),
                  );
                }
                return const Center(
                  child: Text("Error"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
