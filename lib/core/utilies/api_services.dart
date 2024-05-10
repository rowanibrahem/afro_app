
import 'package:dio/dio.dart';

class ApiService{
 

  final _baseUrl = 'https://ab23-156-203-150-233.ngrok-free.app/api/';
  // final _baseUrl = 'http://10.1.1.1:45386/api';
  final Dio dio;

  ApiService(this.dio);

  Future<Response> post (
  {
    // ignore: type_annotate_public_apis
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

  Future get ({required String endPoint}) async{
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
