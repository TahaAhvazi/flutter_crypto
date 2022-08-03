import 'package:crfl/blocs/authentication/authentication_bloc.dart';
import 'package:crfl/routes/home.dart';
import 'package:crfl/routes/signup_route.dart';
import 'package:crfl/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool myValue = false;
  bool secureText = true;
  int times = 0;
  int times_two = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emialController;
    _passwordController;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RepositoryProvider(
      create: (context) => LoginService(),
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) => LoginBloc(
              RepositoryProvider.of<LoginService>(context),
              AuthenticationBloc(
                RepositoryProvider.of<LoginService>(context),
              ),
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height * 97 / 100,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Login to your',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Text(
                                  'account',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.blue,
                                  width: 130,
                                  height: 5,
                                ),
                                const SizedBox(width: 5.0),
                                Container(
                                  color: Colors.blue,
                                  width: 12,
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 3 / 100,
                                ),
                                Container(
                                  height: height * 8 / 100,
                                  width: width * 90 / 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: TextFormField(
                                      controller: _emialController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        hintStyle: TextStyle(fontSize: 18),
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter username or Email';
                                        }
                                        if (value.length < 10) {
                                          return 'email should be more than 10 characters';
                                        }
                                        if (!value.contains("@")) {
                                          return 'Not a valid email addres';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 3 / 100,
                                ),
                                Container(
                                  height: height * 8 / 100,
                                  width: width * 90 / 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter the password';
                                        }
                                        if (value.length < 5) {
                                          return 'Password should be more than 5 characters';
                                        }
                                        return null;
                                      },
                                      obscureText: secureText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle:
                                            const TextStyle(fontSize: 18),
                                        suffixIcon: IconButton(
                                          color: Colors.grey,
                                          onPressed: () {
                                            //  print('Clicked');
                                            setState(() {
                                              secureText = !secureText;
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.remove_red_eye),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 2 / 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: myValue,
                                        onChanged: (value) {
                                          setState(() {
                                            myValue = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        "Remeber me!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final isValidForm =
                                        _formKey.currentState!.validate();
                                    if (isValidForm) {
                                      //return something
                                      context.read<LoginBloc>().add(
                                            OnLoginButtonPressedEvent(
                                              email: _emialController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blueAccent,
                                    ),
                                    height: height * 8 / 100,
                                    width: width * 90 / 100,
                                    child: const Center(
                                        child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Dont have an account? ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const SingUpRoute(),
                                        ));
                                      },
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is LoginSuccessState) {
                      times_two++;
                      if (times_two <= 1) {
                        Future.delayed(
                          Duration.zero,
                          () async {
                            const snackBar = SnackBar(
                              content: Text('Login Success'),
                              backgroundColor: Colors.greenAccent,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      }
                      return const HomeRoute();
                    }
                    if (state is LoginFailureState) {
                      // ignore: deprecated_member_use
                      times++;
                      if (times <= 1) {
                        Future.delayed(
                          Duration.zero,
                          () async {
                            const snackBar = SnackBar(
                              content: Text('Login Faild'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      }
                    }
                    if (state is LoginLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const LoginRoute();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
