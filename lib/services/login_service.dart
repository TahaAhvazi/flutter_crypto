import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    final value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> presistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> loginUser(String email, String password) async {
    Response response = await Dio().post(
      "https://reqres.in/api/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    // ignore: avoid_print
    print(response.data['token']);
    return response.data['token'];
  }
}
