// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.data,
  });

  List<Datum> data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class GetUsersService {
  Future<List<Datum>> getUserList([int startIndex = 0]) async {
    final response =
        await get(Uri.parse("https://reqres.in/api/users?delay=10"));
    final myUsers = usersFromJson(response.body);
    final result = myUsers.data;
    return result;
  }
}
