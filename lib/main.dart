import 'package:crfl/blocs/authentication/authentication_bloc.dart';
import 'package:crfl/routes/home.dart';
import 'package:crfl/routes/login_route.dart';
import 'package:crfl/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationBloc(LoginService())..add(OnAppStartedEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is UserAuthenticatedState) {
              return const HomeRoute();
            }
            if (state is UserAuthenticatingState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is UserUnAuthenticatedState) {
              return const LoginRoute();
            }
            return const LoginRoute();
          },
        ),
      ),
    );
  }
}
