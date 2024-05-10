abstract class SignUpStates{}

class SignUpIntialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates {
  SignUpSuccessState(
    // this.accessToken,
    // this.idToken,
  );

  // final String accessToken;
  // final String idToken;
}
class SignUpFailedState extends SignUpStates{
  SignUpFailedState({
    required this.message,
  });
  String ?message;
}
