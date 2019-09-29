import 'package:auth/event/signup_event.dart';
import 'package:auth/repository/user_repo.dart';
import 'package:auth/states/signup_states.dart';
import 'package:bloc/bloc.dart';

class UserSignUpBloc extends Bloc<SignUpEvent, SignUpStates> {
  final UserRepository userRepository;
  UserSignUpBloc({this.userRepository}) : assert(userRepository != null);
  @override
  SignUpStates get initialState => SignUpUnInitialized();

  @override
  Stream<SignUpStates> mapEventToState(
    SignUpStates currentState,
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield* _mapSignUpButtonPressedToState(event);
    }
  }

  Stream<SignUpStates> _mapSignUpButtonPressedToState(
    SignUpButtonPressed event,
  ) async* {
    yield SignUpLoading();
    try {
      await userRepository.createUser(
        event.user.name,
        event.user.email,
        event.user.password,
        event.user.age.toString(),
      );
      yield SignUpSuccessful();
    } catch (error) {
      // yield SignUpFailure();
    }
  }
}