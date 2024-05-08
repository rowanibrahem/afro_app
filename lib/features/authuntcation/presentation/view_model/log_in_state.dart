abstract class AuthStates{}

class IntialState extends AuthStates{}
class LogInLoadingState extends AuthStates{}
class LogInSuccessState extends AuthStates{
  final String accessToken;
  final String idToken;
  LogInSuccessState(
      this.idToken,
      this.accessToken,
);
}
class LogInFailedState extends AuthStates{
  String ?message;
  LogInFailedState({
    required this.message,
  });
}