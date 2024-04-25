abstract class Failure {
  Failure ({required this.errMessage});
  final String errMessage;
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}