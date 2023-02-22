import 'package:expenses_tracker/services/networking.dart';
import 'dart:convert';

const baseURL = 'http://localhost:8102/api';
const registrationURL = '/auth/signup';

class AuthenticationServices {
  Future<dynamic> signUp(String username, String email, String password) async {
    NetworkHelper networkHelper = NetworkHelper(baseURL + registrationURL);
    Map<String, String> body = {
      'username': username,
      'email': email,
      'password': password,
    };
    print('data : ${jsonEncode(body)}');
    var weatherData = await networkHelper.postData(jsonEncode(body));
    return weatherData;
  }
}
