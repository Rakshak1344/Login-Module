import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginStates extends Equatable {
  LoginStates([List props = const []]):super(props);
}

class LoginLoading extends LoginStates {
  @override
  String toString() => 'LoginLoading';
}

class LoginSuccessful extends LoginStates {
  @override
  String toString() => 'LoggedIn';
}

class LoginFailed extends LoginStates {
  final String error;
  LoginFailed({@required this.error}): super([error]);
  @override
  String toString() => 'LoginFailed';
}
