
import 'package:dio/dio.dart';

class ApiService{
 
  final Dio dio = Dio();
  final _baseUrl = 'http://localhost:8080/api/v1/';

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
