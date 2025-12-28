import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/Sign_up_Sign_in_Apis/Controller/Register_controller.dart';

class LoginScreen_api extends StatelessWidget {
  RegisterController _registerController=Get.put(RegisterController());
   LoginScreen_api({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),

      appBar: AppBar(
        title: const Text(
          'Login API Screen',
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

            // PAGE HEADING TEXT
            Center(
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // MAIN CONTAINER
            Container(
              padding: const EdgeInsets.all(20),
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
                children: [
                  buildInput("Email Address", Icons.email,
                    controller: _registerController.loginemailController,
                  ),
                  const SizedBox(height: 15),
                  buildInput("Password", Icons.lock, isPassword: true,
                  controller: _registerController.loginPassController),
                  const SizedBox(height: 25),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                          () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: _registerController.loginLoading.value
                            ? null // disable button while loading
                            : () {
                          // Call login function
                          _registerController.login(
                            email: _registerController.loginemailController.text.trim(),
                            password: _registerController.loginPassController.text.trim(),
                          );
                        },
                        child: _registerController.loginLoading.value
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : const Text(
                          "Login",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),

            // FOOTER TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1E3A8A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // COMMON INPUT FIELD
  Widget buildInput(
      String label,
      IconData icon, {
        bool isPassword = false,
        required TextEditingController controller, // Add required controller
      }) {
    return TextField(
      controller: controller, // Use the passed controller
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue.shade700),
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
    );
  }

}