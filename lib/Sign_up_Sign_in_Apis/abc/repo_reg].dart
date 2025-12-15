//
//
//
// import 'package:dio/dio.dart';
// import 'package:restapis/Constants/AppUrl/appUrl.dart';
//
// class AuthRepo {
//   Dio dio = Dio();
//
//   Future<Map<String, dynamic>> initiateRegister(Map<String, dynamic> body) async {
//     try {
//       final res = await dio.post(AppUrl.registerUser, data: body);
//       return res.data;
//     } catch (e) {
//       return {"status": "error", "message": e.toString()};
//     }
//   }
//
//   Future<Map<String, dynamic>> sendOtp(String email, String token) async {
//     try {
//       final res = await dio.post(
//         AppUrl.sendOTP,
//         data: {"email": email},
//         options: Options(headers: {"Authorization": "Bearer $token"}),
//       );
//       return res.data;
//     } catch (e) {
//       return {"status": "error", "message": e.toString()};
//     }
//   }
//
//   Future<Map<String, dynamic>> verifyOtp(String email, String code, String token) async {
//     try {
//       final res = await dio.post(
//         AppUrl.verifyOTP,
//         data: {"email": email, "verification_code": code},
//         options: Options(headers: {"Authorization": "Bearer $token"}),
//       );
//       return res.data;
//     } catch (e) {
//       return {"status": "error", "message": e.toString()};
//     }
//   }
//
//   Future<Map<String, dynamic>> loginUser(String email, String password) async {
//     try {
//       final res = await dio.post(AppUrl.loginUser, data: {
//         "email": email,
//         "password": password,
//       });
//       return res.data;
//     } catch (e) {
//       return {"status": "error", "message": e.toString()};
//     }
//   }
//
//   Future<Map<String, dynamic>> getUserProfile(String token, int userId) async {
//     try {
//       final res = await dio.get(
//         AppUrl.getUserProfile(userId),
//         options: Options(headers: {"Authorization": "Bearer $token"}),
//       );
//       return res.data;
//     } catch (e) {
//       return {"status": "error", "message": e.toString()};
//     }
//   }
// }