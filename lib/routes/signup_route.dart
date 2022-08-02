import 'package:crfl/routes/login_route.dart';
import 'package:crfl/routes/signup_route.dart';
import 'package:flutter/material.dart';

class SingUpRoute extends StatelessWidget {
  const SingUpRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool secureText = true;

    bool myValue = false;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height * 97 / 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(fontSize: 18),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Please enter username or Email';
                              }
                              if (value.length < 7) {
                                return 'email should be more than 10 characters';
                              }
                              if (!value.contains("@gmail.com")) {
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
                            validator: (value) {
                              if (value == null) {
                                return 'Please enter the password';
                              }
                              if (value.length < 7) {
                                return 'Password should be more than 7 characters';
                              }
                              return null;
                            },
                            obscureText: secureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: const TextStyle(fontSize: 18),
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                onPressed: () {
                                  //  print('Clicked');
                                },
                                icon: const Icon(Icons.remove_red_eye),
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
                            validator: (value) {
                              if (value == null) {
                                return 'Please enter the password';
                              }
                              if (value.length < 7) {
                                return 'Password should be more than 7 characters';
                              }
                              return null;
                            },
                            obscureText: secureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm password',
                              hintStyle: const TextStyle(fontSize: 18),
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                onPressed: () {
                                  //  print('Clicked');
                                },
                                icon: const Icon(Icons.remove_red_eye),
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
                                myValue = value!;
                              },
                            ),
                            const Text(
                              "By creating an account you agree to out\n Terms & Condistions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final isValidForm = formkey.currentState!.validate();
                          if (isValidForm) {
                            //return something
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
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginRoute(),
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
            ),
          ),
        ),
      ),
    );
  }
}
