import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpStates extends Equatable {
  SignUpStates([List props = const[]]):super(props);
}

class SignUpUnInitialized extends SignUpStates{
  @override
  String toString() => 'SignUpUnInitialized';
}

class SignUpLoading extends SignUpStates {
  @override
  String toString() => 'SignUpLoading';
}

class SignUpSuccessful extends SignUpStates {
  
  @override
  String toString() => 'SignUpSuccessful';
}

class SignUpFailed extends SignUpStates {
  final String error;
  SignUpFailed({@required this.error}):super([error]);
  @override
  String toString() => 'SignUpFailed';
}
