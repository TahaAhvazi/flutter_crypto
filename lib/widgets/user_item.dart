import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.username, required this.avatar})
      : super(key: key);
  final String username;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 12 / 100,
            width: width * 95 / 100,
            child: Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              elevation: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(avatar),
                    ),
                  ),
                  SizedBox(
                    width: width * 1 / 100,
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
