import 'dart:convert';
import 'dart:io';

import 'package:auth/models/user_model.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const baseUrl = "https://task-auth-endpoint-api.herokuapp.com";
  final http.Client httpClient;
  AuthRepository({this.httpClient});

  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    var getToken = "$baseUrl/users/me";
    try {
      var response = await httpClient.post(getToken,body: {
        'email':email,
        'password':password
      },
          headers: {'grant_type': 'password' });
      if (response.statusCode == 200) {
        String token = response.body;
        await Future.delayed(Duration(seconds: 1));
        return token;
      } else {
        throw new Exception('Session TimeOut, please relogin');
      }
    } catch (error) {
      throw new Exception('Unable to fetch Data');
    }
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
