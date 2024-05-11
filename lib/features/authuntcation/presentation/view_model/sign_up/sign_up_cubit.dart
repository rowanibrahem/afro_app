import 'dart:convert';
import 'package:afro_app/constants.dart';
import 'package:afro_app/core/nertwork/cacheNetwork.dart';
import 'package:afro_app/features/authuntcation/presentation/view_model/sign_up/sign_up_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpIntialState());

  // ignore: non_constant_identifier_names
  Future<void> SignUp({
    required String name,
    required String phoneNum,
   required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    try {
      final url = Uri.parse(
          'https://ab23-156-203-150-233.ngrok-free.app/api/v1/auth/register',);

      final jsonData = {
        'name': name,
        'phoneNumber': phoneNum,
        'email': email,
        'password': password,
      };

      final requestBody = jsonEncode(jsonData);

      final Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      // statusCode = response.statusCode;
      print(response.statusCode);

      print("Response Body: ${response.body}");
      final Map<String, dynamic>? data =
          jsonDecode(response.body) as Map<String, dynamic>?;
      if (response.statusCode == 200) {
        // ignore: avoid_dynamic_calls
        token = data!['token'].toString();
        // await CacheNetwork.insertToCashe(
        // key: "token", value: data!["token"],);
        debugPrint('token is :$token');
        await CacheNetwork.insertToCashe(key: "password", value: password);
        token = await CacheNetwork.getCacheData(key: "token");
        emit(SignUpSuccessState());
        debugPrint("LogIN Succcessfully, token is : $token");
      } else {
        emit(SignUpFailedState(message: "Incorrect Username or Password "));
      }
    } catch (e) {
      emit(SignUpFailedState(message: "Something went wrong, Try again later"));
    }
  }
}
