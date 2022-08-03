import 'package:crfl/routes/login_route.dart';
import 'package:crfl/services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/register/register_bloc.dart';

class SingUpRoute extends StatefulWidget {
  const SingUpRoute({Key? key}) : super(key: key);

  @override
  State<SingUpRoute> createState() => _SingUpRouteState();
}

class _SingUpRouteState extends State<SingUpRoute> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool secureText = true;
  bool myValue = false;
  int times = 0;
  // ignore: non_constant_identifier_names
  int times_two = 0;
  // ignore: non_constant_identifier_names
  int times_three = 0;
  @override
  void initState() {
    super.initState();
    _emialController;
    _passwordController;
    _confirmPasswordController;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
      create: (context) => RegisterService(),
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                RegisterBloc(RepositoryProvider.of<RegisterService>(context)),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height * 97 / 100,
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Register new',
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
                                      controller: _confirmPasswordController,
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
                                        hintText: 'Confirm password',
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
                                        "By creating an account you agree to out\n Terms & Condistions",
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
                                      if (_confirmPasswordController.text ==
                                          _passwordController.text) {
                                        context.read<RegisterBloc>().add(
                                              OnRegisterButtonPressedEvent(
                                                  email: _emialController.text,
                                                  password:
                                                      _passwordController.text),
                                            );
                                      } else {
                                        times_two++;
                                        if (times_two <= 1) {
                                          Future.delayed(
                                            Duration.zero,
                                            () async {
                                              const snackBar = SnackBar(
                                                content: Text(
                                                    'Password and confirm password not same'),
                                                backgroundColor: Colors.red,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          );
                                        }
                                      }
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
                                      "Register",
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
                                      "Already have an account? ",
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
                                              const LoginRoute(),
                                        ));
                                      },
                                      child: const Text(
                                        "Login",
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
                    if (state is RegisterFailureState) {
                      times++;
                      if (times <= 1) {
                        Future.delayed(
                          Duration.zero,
                          () async {
                            const snackBar = SnackBar(
                              content: Text('Register Faild'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      }
                    }
                    if (state is RegisterSuccessState) {
                      times_three++;
                      if (times_three < 1) {
                        Future.delayed(
                          Duration.zero,
                          () async {
                            const snackBar = SnackBar(
                              content: Text('Register Successfull'),
                              backgroundColor: Colors.greenAccent,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      }
                      return const LoginRoute();
                    }
                    if (state is RegisterLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SingUpRoute();
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
