// String? accessToken;
// late String cachedPhoneNr;
// // late bool isExpired;

// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(IntialState());

//   var formKey;
//   static var keys = [];
//   static var fetchedData;
//   var phoneNr;
//   var iqamaNr;
//   var lang;
//   var report;
//   var driverId;
//   var driverName;
//   String? msgToken;


//   void login(context) async {
//     emit(LogInLoadingState());
//     bool hasData = false;
//     for(String url in urls){
//       try {
//         print("$url/testjwt");
//         final response = await http.post(
//           Uri.parse("$url/testjwt"),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode({
//             "iqama_number": iqamaNr,
//             "phone_number": phoneNr,
//             // "otp": otpVal,
//           }),
//         );

//         // statusCode = response.statusCode;
//         print(response.statusCode);

//         print("Response Body: ${response.body}");
//         var data = jsonDecode(response.body);
//         if (response.statusCode == 202) {
//           print("success");
//           accessToken = data["access_token"];
//           await CacheNetwork.insertToCashe(
//               key: "access_token", value: data["access_token"]);
//           await CacheNetwork.insertToCashe(key: 'phoneNr', value: phoneNr);
//           selectedUrl=url;
//           await CacheNetwork.insertToCashe(key: 'selectedUrl', value: selectedUrl!);

//           emit(OtpVerificationSuccessState());
//           await getUserData();
//           hasData=true;
//           break;
//         } else {
//           // emit(OtpVerificationFailedState(message: data["message"]));
//         }
//       } catch (e) {
//         print("errorr, $e");
//         // emit(OtpVerificationFailedState(
//         //     message: "Something went wrong , Try again later "));
//         // statusCode = 0;
//       }
//     }
//     if(!hasData){
//       emit(VerificationCodeFailedState(message: "Something went wrong , try again later".tr(context)));

//     }

//   }
