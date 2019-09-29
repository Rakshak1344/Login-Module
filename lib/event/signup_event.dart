import 'package:auth/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const []]) : super(props);
}

class SignUpButtonPressed extends SignUpEvent {
  final User user;
  // final String name;
  // final String email;
  // final String password;
  // final int age;

  SignUpButtonPressed({this.user}) : assert(user != null);
  // SignUpButtonPressed(
  //     {@required this.name,
  //     @required this.email,
  //     @required this.password,
  //     @required this.age})
  //     : super([name, email, password, age]);

  // @override
  // String toString() =>
  //     'SignupButtonPressed{name: $name,email: $email,password: $password,age: $age}';
}
