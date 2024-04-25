
import 'package:dio/dio.dart';

class ApiService{
  final Dio dio = Dio();

  Future<Response> post (
  {
    required body ,
    required String url ,
    required String token ,
    String? contentType,
    Map<String , String>? headers,
}) async {
    final response = await dio.post(
      url ,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),);
    return response;
  }
}
