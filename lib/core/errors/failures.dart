// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failure {

  Failure(this.errMessage);
  final String errMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with Api Server');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with Api Server');

      case DioErrorType.badCertificate:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data,);

      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message'] as String);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops There was an Error, Please try again');
    }
  }
}
