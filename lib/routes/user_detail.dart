import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class UserDetail extends StatelessWidget {
  final String username;
  final int id;
  final String email;
  final String lastName;
  final String avatar;
  const UserDetail(
      {Key? key,
      required this.username,
      required this.id,
      required this.email,
      required this.lastName,
      required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "$username Profile",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 5, 0, 77),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 30 / 100,
              width: width,
              color: const Color.fromARGB(255, 5, 0, 77),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(avatar),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'ID :',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    id.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Username: ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'First name: ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Last name: ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    lastName,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
