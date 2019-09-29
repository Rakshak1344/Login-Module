import 'package:meta/meta.dart';

class TokenString {
  User user;
  String token;

  TokenString({this.user, this.token});

  TokenString.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String name;
  int age;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  StringBuffer avatar;

  User({
    @required this.name,
    @required this.email,
    @required this.password,
    this.age,
    this.createdAt,
    this.updatedAt,
    this.avatar
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['age'] = this.age;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['avatar'] = this.avatar;
    return data;
  }
}
