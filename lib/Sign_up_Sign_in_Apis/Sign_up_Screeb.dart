import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/Sign_up_Sign_in_Apis/Controller/Register_controller.dart';

class SignUpScreen_api extends StatelessWidget {
  const SignUpScreen_api({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Sign Up API Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),

            const SizedBox(height: 15),

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
                  buildInput(
                    "Full Name",
                    Icons.person,
                    controller: registerController.nameController,
                  ),
                  const SizedBox(height: 15),

                  buildInput(
                    "Email Address",
                    Icons.email,
                    controller: registerController.emailController,
                  ),
                  const SizedBox(height: 15),

                  buildInput(
                    "Password",
                    Icons.lock,
                    isPassword: true,
                    controller: registerController.passwordController,
                  ),
                  const SizedBox(height: 15),

                  buildInput(
                    "Confirm Password",
                    Icons.lock_outline,
                    isPassword: true,
                    controller: registerController.confirmPasswordController,
                  ),
                  const SizedBox(height: 25),

                  // ⭐ SIMPLE LOADING BUTTON ⭐
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      final bool loading = registerController.isLoading.value;

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          loading ? Colors.white : const Color(0xFF1E3A8A),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        onPressed: loading
                            ? null
                            : () {
                          registerController.register();
                        },

                        child: loading
                            ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: const AlwaysStoppedAnimation(
                                Color(0xFF1E3A8A)), // blue loader
                          ),
                        )
                            : const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Login",
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

  Widget buildInput(
      String label,
      IconData icon, {
        bool isPassword = false,
        TextEditingController? controller,
      }) {
    return TextField(
      controller: controller,
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
