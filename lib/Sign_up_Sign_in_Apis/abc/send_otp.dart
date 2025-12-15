// otp screen
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:restapis/Constants/AppColors/appColors.dart';
// import 'package:restapis/Controller/AuthController/authController.dart';
// import 'package:restapis/Widgets/CustomButton/customButton.dart';
// import 'package:restapis/Widgets/CustomTextField/customTextField.dart';
// import 'package:restapis/Widgets/IsLoading/isLoading.dart';
// import 'package:restapis/Widgets/textWidget/textWidget.dart';
//
// class OtpView extends StatelessWidget {
//   final String email;
//   OtpView({super.key, required this.email});
//
//   final authController = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextWidget.h3("email: $email", AppColors.greenColor, context),
//                 SizedBox(height: 20),
//                 Customtextfield(
//                   controller: authController.otpController,
//                   label: "Verification code",
//                   text: authController.otpController.text,
//                 ),
//                 SizedBox(height: 20),
//                 Obx(
//                       () => authController.otpLoading.value
//                       ? Center(child: IsLaoding())
//                       : GestureDetector(
//                     onTap: () {
//                       authController.verifyOtp(email);
//                     },
//                     child: CustomButton(
//                       text: "Verify",
//                       color: AppColors.blueColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     authController.sendOtp(email);
//                   },
//                   child: CustomButton(
//                     text: "Resend Otp",
//                     color: AppColors.navyBlueColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }