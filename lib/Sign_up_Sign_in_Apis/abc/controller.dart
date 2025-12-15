//
// mport 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:restapis/Services/Repo/authRepo.dart';
// import 'package:restapis/View/AuthViews/OtpView/otpview.dart';
// import 'package:restapis/routes/appRoutes.dart';
//
// class AuthController extends GetxController {
//   final AuthRepo authRepo = AuthRepo();
//   final GetStorage getStorage = GetStorage();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//
//   var isLoading = false.obs;
//   var otpLoading = false.obs;
//   var profileLoading = false.obs;
//
//   RxMap profile = {}.obs;
//
//
//   register() async {
//     isLoading.value = true;
//
//     final res = await authRepo.initiateRegister({
//       "name": nameController.text.trim(),
//       "email": emailController.text.trim(),
//       "password": passwordController.text,
//       "confirm_password": confirmPasswordController.text,
//     });
//
//     isLoading.value = false;
//
//     if (res["status"] == "success") {
//       final tempToken = res["token"];
//       getStorage.write("tempToken", tempToken);
//
//       final success = await sendOtp(emailController.text.trim());
//       if (success) Get.to(() => OtpView(email: emailController.text.trim()));
//
//     } else {
//       Get.snackbar("Error", res["message"]);
//     }
//   }
//
//   Future<bool> sendOtp(String email) async {
//     otpLoading.value = true;
//
//     final token = getStorage.read("tempToken");
//     final res = await authRepo.sendOtp(email, token);
//
//     otpLoading.value = false;
//
//     if (res["status"] == "success") {
//       Get.snackbar("Success", "OTP sent");
//       return true;
//     } else {
//       Get.snackbar("Error", res["message"]);
//       return false;
//     }
//   }
//
//   verifyOtp(String email) async {
//     otpLoading.value = true;
//
//     final token = getStorage.read("tempToken");
//     final res = await authRepo.verifyOtp(email, otpController.text.trim(), token);
//
//     otpLoading.value = false;
//
//     if (res["status"] == "success") {
//       final finalToken = res["token"];
//       final userId = res["user"]["id"];
//
//       getStorage.write("token", finalToken);
//       getStorage.write("userId", userId);
//
//       Get.snackbar("Success", "Account Created!");
//       print("successfully login");
//       Get.toNamed(AppRoutes.signinScreen);
//
//     } else {
//       Get.snackbar("Error", res["message"]);
//     }
//   }
//
//
//   login() async {
//     isLoading.value = true;
//
//     final res = await authRepo.loginUser(
//       emailController.text.trim(),
//       passwordController.text.trim(),
//     );
//
//     isLoading.value = false;
//
//     if (res["status"] == "success") {
//       getStorage.write("token", res["token"]);
//       getStorage.write("userId", res["user"]["id"]);
//
//       Get.toNamed(AppRoutes.profileScreen);
//     } else {
//       Get.snackbar("Error", res["message"]);
//     }
//   }
//
//
//   getProfile() async {
//     profileLoading.value = true;
//
//     final token = getStorage.read("token");
//     final userId = getStorage.read("userId");
//
//     final res = await authRepo.getUserProfile(token, userId);
//
//     profileLoading.value = false;
//
//     if (res["status"] == "success") {
//       profile.value = res["user"];
//     } else {
//       Get.snackbar("Error", res["message"]);
//     }
//   }
// }