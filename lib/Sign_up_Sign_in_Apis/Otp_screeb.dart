import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/Sign_up_Sign_in_Apis/Controller/Register_controller.dart';

class OtpScreen_Api extends StatelessWidget {
  final String email;
  const OtpScreen_Api({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController=Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),

      appBar: AppBar(
        title: const Text(
          "OTP Verification",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: const Text(
                "Enter OTP",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter the 4-digit code sent to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextField(
                    controller: registerController.otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      labelText: "Enter OTP",
                      filled: true,
                      fillColor: const Color(0xFFF0F4FF),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.blue.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.blue.shade700, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // VERIFY BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: registerController.otpLoading.value
                            ? Colors.white
                            : const Color(0xFF1E3A8A),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: registerController.otpLoading.value
                          ? null
                          : () async {
                        final otp = registerController.otpController.text.trim();
                        if (otp.length == 4) {
                       await registerController.verifyOtp(otp, email);
                        } else {
                          Get.snackbar("Error", "Please enter a 4-digit OTP");
                        }
                      },
                      child: registerController.otpLoading.value
                          ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: const Color(0xFF1E3A8A),
                          strokeWidth: 2.5,
                        ),
                      )
                          : const Text(
                        "Verify OTP",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    )),
                  ),

                  const SizedBox(height: 15),

                  // RESEND BUTTON (UPDATED)
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: registerController.resendotpLoading.value
                            ? const Color(0xFFE0E0E0)
                            : Colors.white,
                      ),
                      onPressed: registerController.resendotpLoading.value
                          ? null
                          : () async {
                        final email = registerController.emailController.text.trim();
                        if (email.isNotEmpty) {
                          await registerController.sendOtp(email,);
                        } else {
                          Get.snackbar("Error", "Email not found for resending OTP");
                        }
                      },
                      child: registerController.resendotpLoading.value
                          ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: const Color(0xFF1E3A8A),
                          strokeWidth: 2.5,
                        ),
                      )
                          : const Text(
                        "Resend OTP",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF1E3A8A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
