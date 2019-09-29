import 'package:equatable/equatable.dart';

abstract class AuthenticationStates extends Equatable{}

class AuthenticationUnInitialized extends AuthenticationStates{
  @override
  String toString()=>'AuthenticationUnInitialized';
}

class AuthenticationLoading extends AuthenticationStates{
  @override
  String toString()=>'AuthenticationLoading';
}

class AuthenticationAuthorized extends AuthenticationStates{
  @override
  String toString()=>'AuthenticationAuthorized';
}

class AuthenticationUnAuthorized extends AuthenticationStates{
  @override
  String toString()=>'AuthenticationUnAuthorized';
}