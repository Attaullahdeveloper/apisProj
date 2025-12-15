// register_repo.dart
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterRepo {
 final Dio dio = Dio();

 // URL Constants
 static const String _baseUrl = "https://etalk.mtai.live";
// static const String _baseUrl = "https://etalk.mtai.live";
 static const String _token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5ZWNhZTVhMC0wNWE4LTQ1NjItYTYwMC0zMjBjNTA1YWVhYmYiLCJqdGkiOiJjNjQ4NDhiNzBiNTkwZjc1NWE4MWY4YmUyYzhlYTJkZmU5ODMyYzJhNDFjOTM0MzUxZDJlODY3MmFlMjgwODRmMzhjZDUxMmRkYjVjOWI0MiIsImlhdCI6MTc2NDU4MTE2OC45NjAwNzksIm5iZiI6MTc2NDU4MTE2OC45NjAwODEsImV4cCI6MTc4MDMwNTk2OC45NDgyNjYsInN1YiI6IjkzIiwic2NvcGVzIjpbXX0.wjfshjPINsKkuq9nHMOnsgkZYYCtH0dHEuGTSwbvTuv2DYxBHsjnlK6oexNBSD8xDeRWMfq5GODqJbPxOkrp313eFDiHoFYmtX-nfFXqbXQAfr0BDJwhHHHIQr_q9qieTu0OGdpRLB66T8NunQifilc3MxuYiNI9NP8gZ4FjorZEyO6w02MYQmxwe1n_J7yFptP2UFFtX1ZtHVVUmGKZA7MhJQrh6gmWn-HPpYqPi2N3Q_eBwxjzckEYmuQTluHWhpzmIAImVQXQwvg0v0W8LKGHi-yMQTEhpntf3ah938-y7oXQx6YJ5JXxpwgRXrEhBpyCTVN8WPawGMvpQlyqX_aHi92niW3zbCuuSS9q-zCOy0IFXIbM5YK5x5XfwMivFcvnvGcnmO7tKHq571BiRrUSRzyZd1TFW2k6hBa-o1vnkFPOTyRLjNgXaKhJcuRO3Fw2uyNcbstmO1NVRj-8Rrnee6awALdZN69VkJFvGLGklBzO5lR3jLTU3ZpmJ_d4pszNGSI8kp-Q4sxaeA5duf0N1eE6jdS3uDa-1vjeOj3Fn1_TSdHkaaLvn97wk4KP7yytY1kcQgJSQwMwnGkb4m0kjeaDgc0vZ5IO0oRWivS1SQpY7bHlUiARjUw2D33myrT-6ynM-086XBKTrohvvjg3nA537Tg495BBBZ9VNTw";

 static const String registerUrl = "$_baseUrl/api/user/register";
 static const String sendOtpUrl = "$_baseUrl/api/user/send-verification-code";
 static const String verifyOtpUrl = "$_baseUrl/api/user/verify-otp";
 static const String getProfileUrl = "$_baseUrl/api/user/{userId}/profile";
 static const String loginUrl = "$_baseUrl/api/user/login";
 static String postUserurl(String userId) => "$_baseUrl/api/user/$userId/profile";
 // Register Function
  Future<Map<String,dynamic>> registerUser(Map<String,dynamic>body) async{
   try {
    final response=await dio.post(registerUrl,data: body);
   return response.data;
   }
       catch(e) {
        return {"status": "error", "message": e.toString()};
   }
  }
 // sent otp repo function============================
 Future<Map<String, dynamic>> sendOtp(String email, String token) async {
  try {
   final response = await dio.post(
   sendOtpUrl,
    data: {"email": email},
    options: Options(
     headers: {
      "Authorization": "Bearer $token",
     },
    ),
   );
   return response.data;
  } catch (e) {
   return {"status": "error", "message": e.toString()};
  }
 }
 // verify otp repo function=================================
Future<Map<String,dynamic>> verifyotp({
  required String email,
 required String verificationCode,
})async{
   try{

    final response=await dio.post(
     verifyOtpUrl,
    data: {
     'email': email,
     'verification_code': verificationCode,
    },
    );
    if(response.statusCode==200){
     return response.data as Map<String,dynamic>;
    }else{
     throw Exception('OTP verification failed:${response.statusMessage}');
    }
   } on DioException catch(e){
    if(e.response !=null){
     throw Exception(e.response?.data['message']?? 'OTP verification failed.Please try again');
    } else {
     throw Exception('Network error.Please check you connection.:');
    }
   }
       catch(e){
    throw Exception('An error occurred:${e.toString()
    }');
       }

   }

   // login Api repo---------
 Future<Map<String, dynamic>> login({
  required String email,
  required String password,
  String? fcmToken,
 }) async {
  try {
   final response = await dio.post(
    loginUrl,
    data: {
     'email': email,
     'password': password,
     'fcm_token': fcmToken,
    },
   );

   if (response.statusCode == 200) {
    return response.data as Map<String,dynamic>;
   } else {
  throw Exception('Login failed:${response.statusMessage}');
   }
  } on DioException catch (e) {
   if(e.response!=null){
    throw Exception(
     e.response?.data['message']??'Login failed.Please try again',
    );
   }else{throw Exception('Network error .Please check your Internet');}
  }catch(e){
   throw Exception('An error occurred : ${e.toString()}');
  }
 }


 // ----------------------------------------------------------
 //  POST / UPDATE PROFILE
 // ----------------------------------------------------------
 Future<Map<String, dynamic>> updateProfile({
  required String userId,           // Logged-in user ID
  required String token,            // Auth token
  required String nickname,
  required String gender,           // Dropdown selected value
  required String bio,
  String? location,                 // Optional, will be filled by GeoLocator later
  required String age,
  required String spokenLanguage,   // Dropdown selected value
  required String learningLanguage, // Dropdown selected value
  required String avatar,
 })async {
   try{
    final data = {
     "nickname": nickname,
     "gender": gender,
     "bio": bio,
     "age": age,
     "spoken_language": spokenLanguage,
     "learning_language": learningLanguage,
     "avatar": avatar,
    };
    // Include location only if it’s not null
    if (location != null && location.isNotEmpty)
    {
     data["location"] = location;
    }

    final response=await dio.post(
     postUserurl(userId),
     data: data,
     options: Options(
      headers: {
       "Authorization":"Bearer $token",
       "Content-Type": "application/json",
      }
     )
    );
    if(response.statusCode==200){
     return response.data as Map<String, dynamic>;
    }else{
     throw Exception("Profile Update failed:${response.statusMessage}");
    }
   }on DioException catch(e){
    if (e.response != null) {
     throw Exception(
         e.response?.data["message"] ?? "Failed to update profile");
    } else {
     throw Exception("Network error. Please check your connection.");
    }
   }
       catch(e){
        throw Exception("Unexpected error: ${e.toString()}");
       }
 }

// ----------------------------------------------------------
//  GET / User PROFILE
// ----------------------------------------------------------
 Future<Map<String, dynamic>?> getProfile() async {
  try {
   final response = await dio.get(
    "$_baseUrl/api/user/93/profile",
    options: Options(headers: {"Authorization": _token}),
   );
   return response.data;
  } catch (e) {
   print("API Error: $e");
   return null;
  }
 }
}





