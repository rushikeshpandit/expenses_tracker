import 'package:expenses_tracker/services/networking.dart';
import 'dart:convert';

const baseURL =
    'http://expensestracker-env-1.eba-mahdn4hh.ap-south-1.elasticbeanstalk.com/api';
const registrationURL = '/auth/signup';
const loginURL = '/auth/signin';

class AuthenticationServices {
  Future<dynamic> signUp(String username, String email, String password) async {
    NetworkHelper networkHelper = NetworkHelper(baseURL + registrationURL);
    Map<String, String> body = {
      'username': username,
      'email': email,
      'password': password,
    };
    print('data : ${jsonEncode(body)}');
    var response = await networkHelper.postData(jsonEncode(body));
    return response;
  }

  Future<dynamic> signIn(String username, String password) async {
    NetworkHelper networkHelper = NetworkHelper(baseURL + loginURL);
    Map<String, String> body = {
      'username': username,
      'password': password,
    };
    print('data : ${jsonEncode(body)}');
    var response = await networkHelper.postData(jsonEncode(body));
    return response;
  }
}
