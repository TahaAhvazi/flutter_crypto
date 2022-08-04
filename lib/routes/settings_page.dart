import 'package:crfl/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Night Mode"),
                ElevatedButton(
                  onPressed: () {
                    Get.isDarkMode
                        ? Get.changeTheme(ThemeData.light())
                        : Get.changeTheme(ThemeData.dark());
                  },
                  child: const Text("Change"),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Log Out"),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(OnUserLoggedOutEvent());
                      },
                      child: const Text('Logout'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
