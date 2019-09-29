import 'dart:async';

import 'package:auth/event/auth_event.dart';
import 'package:auth/repository/user_auth_repo.dart';
import 'package:auth/states/auth_states.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationStates> {
  final AuthRepository authRepository;

  AuthenticationBloc({@required this.authRepository})
      : assert(authRepository != null);

  @override
  AuthenticationStates get initialState => AuthenticationUnInitialized();

  @override
  Stream<AuthenticationStates> mapEventToState(
    AuthenticationStates currentState,
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await authRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthorized();
      } else {
        yield AuthenticationUnAuthorized();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authRepository.persistToken(event.token);
      yield AuthenticationAuthorized();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authRepository.deleteToken();
      yield AuthenticationUnAuthorized();
    }
  }
}
