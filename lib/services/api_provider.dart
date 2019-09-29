import 'package:auth/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  static const baseUrl = "https://task-auth-endpoint-api.herokuapp.com";
  final http.Client httpClient;
  ApiProvider({this.httpClient});

  var headers = {"Content-Type": "application/json"};

  Future<User> createUser(name, email, password, age) async {
    var createUserUrl = "$baseUrl/users";
    Map data =
        User(name: name, email: email, password: password, age: age).toJson();
    var body = jsonEncode(data);
    try {
      var response =
          await httpClient.post(createUserUrl, body: body, headers: headers);
      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Bad Request');
      }
    } catch (error) {
      throw new Exception('Unable to fetch the user');
    } finally {
      httpClient.close();
    }
  }

  Future<User> loginUser(email, password) async {
    var loginUserUrl = "$baseUrl/users/login";
    Map data = User(email: email, password: password).toJson();
    var body = jsonEncode(data);
    try {
      var response =
          await httpClient.post(loginUserUrl, body: body, headers: headers);
      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Bad Request');
      }
    } catch (error) {
      throw new Exception('Unable to fetch Data');
    }
  }

  Future<User> fetchProfile() async {
    var fetchProfileUrl = "$baseUrl/users/me";
    try {
      var response = await httpClient.get(fetchProfileUrl, headers: headers);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Invalid Request');
      }
    } catch (error) {
      throw new Exception('Unable to fetch Data');
    }
  }

  Future<User> logoutUser() async {
    var logoutUserUrl = "$baseUrl/users/logout";
    try {
      var response = await httpClient.post(logoutUserUrl, headers: headers);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Bad Request');
      }
    } catch (error) {
      throw new Exception('UnUnable to serve');
    }
  }

  Future<User> logoutAllUser() async {
    var logoutUserUrl = "$baseUrl/users/logoutAll";
    try {
      var response = await httpClient.post(logoutUserUrl);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Bad Request');
      }
    } catch (error) {
      throw new Exception('UnUnable to serve');
    }
  }

  Future<User> uploadUserAvatar(avatar) async {
    var avatarUrl = "$baseUrl/users/me/avatar";
    Map data = User(avatar: avatar).toJson();
    var body = jsonEncode(data);
    try {
      var response = await httpClient.post(avatarUrl, body: body);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw new Exception('Bad Request');
      }
    } catch (error) {
      throw new Exception('UnUnable to serve');
    }
  }

  Future<User> updateUserProfile(name, age, email, password) async {
    var updateProfileUrl = "$baseUrl/users/me";
    Map data =
        User(name: name, age: age, email: email, password: password).toJson();
    var body = jsonEncode(data);
    try {
      httpClient.patch(updateProfileUrl, body: body, headers: headers);
    } catch (error) {
      throw new Exception("unable to update");
    }
  }
}
// User.fromJson(jsonDecode(response.body));
