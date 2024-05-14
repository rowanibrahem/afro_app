import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates{}

class IntialState extends AuthStates{}
class LogInLoadingState extends AuthStates{}
class LogInSuccessState extends AuthStates {
  LogInSuccessState(
    // this.accessToken,
    // this.idToken,
  );

  // final String accessToken;
  // final String idToken;
}
class LogInFailedState extends AuthStates{
  LogInFailedState({
    required this.message,
  });
  String ?message;
}

class AuthAuthenticated extends AuthStates {

  AuthAuthenticated(this.user);
  final User user;
}