// register-screen
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
// import 'package:restapis/Widgets/OutlineTextField/outlineTextField.dart';
// import 'package:restapis/Widgets/textWidget/textWidget.dart';
// import 'package:restapis/routes/appRoutes.dart';
//
// class SignupView extends StatelessWidget {
//   SignupView({super.key});
//   final authController = Get.put(AuthController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextWidget.h2("Signup", AppColors.whiteColor, context),
//         backgroundColor: AppColors.blueColor,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: TextWidget.h("Register", AppColors.blueColor, context),
//                 ),
//                 SizedBox(height: 70),
//                 Outlinetextfield(
//                   controller: authController.nameController,
//                   text: "Full name",
//                 ),
//                 SizedBox(height: 20),
//                 Outlinetextfield(
//                   controller: authController.emailController,
//                   text: "E-mail",
//                 ),
//                 SizedBox(height: 20),
//                 Outlinetextfield(
//                   controller: authController.passwordController,
//                   text: "Password",
//                 ),
//                 SizedBox(height: 20),
//                 Outlinetextfield(
//                   controller: authController.confirmPasswordController,
//                   text: "Confirm Password",
//                 ),
//                 SizedBox(height: 70),
//                 Obx(
//                       ()=> authController.isLoading.value ? Center(child: IsLaoding(),) :
//                   Center(
//                     child: GestureDetector(
//                       onTap: (){
//                         authController.register();
//                       },
//                       child: CustomButton(
//                         text: "Register",
//                         color: AppColors.purpleColor,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: GestureDetector(
//                     onTap: (){
//                       Get.toNamed(AppRoutes.signinScreen);
//                     },
//                     child: CustomButton(
//                       text: "Have account? Sign in",
//                       color: AppColors.blueColor,
//                     ),
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