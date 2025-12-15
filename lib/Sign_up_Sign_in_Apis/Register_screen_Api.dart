import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/signup_signin_screen/Hoomescreen.dart';

import 'Controller/Register_controller.dart';
import 'Register_repo/Home_Screen.dart';

class ProfileScreen_Api extends StatefulWidget {

  const ProfileScreen_Api({super.key});

  @override
  State<ProfileScreen_Api> createState() => _ProfileScreen_ApiState();
}

class _ProfileScreen_ApiState extends State<ProfileScreen_Api> {
  RegisterController registerController=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        title: const Text(
          "Complete Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
        
              child: Column(
                children: [
                  // --------------------------
                  // Profile Picture
                  // --------------------------
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                          AssetImage("assets/sm1.png"),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement image picker
                          },
                          child: const Text("Upload Profile Image"),
                        ),
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 20),
        
                  // Nickname
                  _buildInput("Nickname",
                    controller: registerController.nicknameController,
                  ),
                  const SizedBox(height: 15),
        
                  // --------------------------
                  // Gender Dropdown
                  // --------------------------
                  _buildGenderDropdown(
        
                  ),
                  const SizedBox(height: 15),
        
                  // Bio
                  _buildInput("Bio", maxLines: 3,
                  controller: registerController.bioController),
                  const SizedBox(height: 15),
        
                  // Location
                  _buildInput("Location",
                  controller: TextEditingController(text: registerController.location)),
                  const SizedBox(height: 15,
                  ),
        
                  // Age
                  _buildInput("Age",
                  controller: registerController.ageController),
                  const SizedBox(height: 15),
        
                  // --------------------------
                  // Spoken Languages Dropdown
                  // --------------------------
                  _buildSpokenDropdown(),
                  const SizedBox(height: 15),
        
                  // --------------------------
                  // Learning Languages Dropdown
                  // --------------------------
                  _buildLearningDropdown(),
                  const SizedBox(height: 25),
        
                  // Save Button
                  // -----------------------------
                  //  Save Profile Button
                  // Calls controller.saveProfile
                  //  Loading indicator with Obx
                  // -----------------------------
                  Obx(() => registerController.postuerloading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final token = registerController.token.value;
                        final userId = registerController.userId.value.toString();
        
                        if (token.isEmpty || userId == "0") {
                          Get.snackbar("Error", "User not logged in",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                          return;
                        }
        
                        try {
                          // 🔹 Call API to save profile
                           registerController.saveProfile(
                            userId: userId,
                            token: token,
                            avatar: "profile.png",
                          );
        
                          // 🔹 Show success snackbar
                          Get.snackbar(
                            "Success",
                            "Profile updated successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            duration: const Duration(seconds: 2),
                          );
        
                          // 🔹 Navigate to home screen after a short delay
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen_Api())); // Replace '/home' with your home route
                          });
                        } catch (e) {
                          // 🔹 Handle errors
                          Get.snackbar(
                            "Error",
                            "Failed to update profile: $e",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Save Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
        
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // REUSABLE TEXT FIELD
  // -----------------------------------------------------
  Widget _buildInput(
      String label, {
        int maxLines = 1,
        TextEditingController? controller, //  make it optional
      }) {
    return TextField(
      controller: controller, //  will be used only if not null
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF1E3A8A),
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: const Color(0xFFF0F4FF),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.blue.shade200,
            width: 1.2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color(0xFF1E3A8A),
            width: 1.6,
          ),
        ),
      ),
    );
  }


  // -----------------------------------------------------
  // GENDER DROPDOWN
  // -----------------------------------------------------
  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.blue.shade200,
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: registerController.selectedGender,
          hint: const Text(
            "Gender",
            style: TextStyle(
              color: Color(0xFF1E3A8A),
              fontWeight: FontWeight.w600,
            ),
          ),
          items: const [
            DropdownMenuItem(value: "Male", child: Text("Male")),
            DropdownMenuItem(value: "Female", child: Text("Female")),
            DropdownMenuItem(value: "Other", child: Text("Other")),
          ],
          onChanged: (value) {
            setState(() {
              registerController.selectedGender = value;
            });
          },
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // SPOKEN LANGUAGE DROPDOWN
  // -----------------------------------------------------
  Widget _buildSpokenDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.blue.shade200,
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: registerController.spokenLanguage,
          hint: const Text(
            "Spoken Languages",
            style: TextStyle(
              color: Color(0xFF1E3A8A),
              fontWeight: FontWeight.w600,
            ),
          ),
          items: const [
            DropdownMenuItem(value: "Spanish", child: Text("Spanish")),
          ],
          onChanged: (value) {
            setState(() {
              registerController.spokenLanguage = value;
            });
          },
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // LEARNING LANGUAGE DROPDOWN
  // -----------------------------------------------------
  Widget _buildLearningDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.blue.shade200,
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: registerController.learningLanguage,
          hint: const Text(
            "Learning Languages",
            style: TextStyle(
              color: Color(0xFF1E3A8A),
              fontWeight: FontWeight.w600,
            ),
          ),
          items: const [
            DropdownMenuItem(value: "Spanish", child: Text("Spanish")),
          ],
          onChanged: (value) {
            setState(() {
              registerController.learningLanguage = value;
            });
          },
        ),
      ),
    );
  }
}
