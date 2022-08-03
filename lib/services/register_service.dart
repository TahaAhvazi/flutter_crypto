import 'package:dio/dio.dart';

class RegisterService {
  Future<String> registerUser(String email, String password) async {
    Response response = await Dio().post(
      "https://reqres.in/api/register",
      data: {
        "email": email,
        "password": password,
      },
    );
    // ignore: avoid_print
    print("Register Token :${response.data['token']}");
    return response.data['token'];
  }
}
