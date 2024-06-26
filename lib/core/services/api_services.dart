
import 'package:dio/dio.dart';

class ApiService{

  ApiService(this.dio);
 

  final _baseUrl = 'https://1258-156-203-131-1.ngrok-free.app/api/';
  // final _baseUrl = 'http://10.1.1.1:45386/api';
  final Dio dio;

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
    final response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
