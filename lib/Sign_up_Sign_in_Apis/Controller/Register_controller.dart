

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stat1proj/Sign_up_Sign_in_Apis/Register_repo/Services-class.dart';

import '../Otp_screeb.dart';
import '../Register_repo/Register_repo.dart';
import '../Register_screen_Api.dart';
import '../Sign_in_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../Register_repo/Home_Screen.dart';

class RegisterController extends GetxController{

  // Repository that handles API calls
  final RegisterRepo _registerRepo=RegisterRepo();
  final StorageService storageService=Get.put(StorageService());
  final ProfileScreen_Api _profileScreen_Api=Get.put(ProfileScreen_Api());


  // Local storage for saving temporary and final tokens
 final GetStorage getStorage=GetStorage();

  // Text controllers for input fields
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController ageController = TextEditingController();

// Loading indicators
 var isLoading=false.obs;
 var otpLoading=false.obs;
 var resendotpLoading=false.obs;
 var loginLoading=false.obs;
 var postuerloading=false.obs;
 // get user
 var getLoading=false.obs;
  var profileData = <String, dynamic>{}.obs;
  var error = "".obs;
 // get user
  var token = ''.obs;
  var userId = 0.obs;
  var userEmail = ''.obs;
  // Optional location
  String? location;
  // selection -----------
  String? selectedGender;
  String? spokenLanguage;
  String? learningLanguage;
  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }
// RxMap (reactive) to store profile if needed later
RxMap profile={}.obs;

// ---------------------------
// REGISTER USER
// ---------------------------
register()async{
  isLoading.value=true;
  // Call register API
  final res=await _registerRepo.registerUser({
    "name":nameController.text.trim(),
    "email":emailController.text.trim(),
    "password":passwordController.text.trim(),
    "confirm_password":confirmPasswordController.text.trim(),
  });

  isLoading.value=false;

  // If API returns success
 if(res["status"]=="success"){

   // Temporary token required for OTP API
   final tempToken=res['token'];
   getStorage.write("token", tempToken);

   // Send OTP after successful registration
final success = await sendOtp(emailController.text.trim());

   // Navigate to OTP screen if sent successfully
  if(success) Get.to(()=> OtpScreen_Api(email: emailController.text.trim(),));
  else {
    // show api error
    Get.snackbar("Error", res["message"]);
  };

 }
}

// ---------------------------
// SEND OTP
// ---------------------------
Future<bool> sendOtp(String email)async{
  resendotpLoading.value=true;

  // Read temporary token saved during register
  final token=getStorage.read('token');

  // Call Send OTP API
  final res= await _registerRepo.sendOtp(email, token);

  resendotpLoading.value=false;
  if (res["status"] == "success") {
    Get.snackbar("Success", "OTP sent successfully");
    return true;
  } else {
    Get.snackbar("Error", res["message"]);
    return false;
  }

}

// ---------------------------
// VERIFY OTP
// ---------------------------
 Future<void> verifyOtp(String verificationCode,String email)async{
  try{
    otpLoading.value=true;
    final response=await _registerRepo.verifyotp(email: email, verificationCode: verificationCode);
    otpLoading.value=false;
    Get.snackbar(
        'Success',
      response['message']?? 'OTP verified successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFF4CAF50),
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      duration: Duration(seconds: 3),
        );
    // navigation to login page--------------------
    await Future.delayed(Duration(microseconds: 500));
    Get.to(LoginScreen_api());
  }
      catch(e){
    otpLoading.value=false;
    Get.snackbar(
        'Error',
        e.toString().replaceAll('Exception:',''),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      duration: Duration(seconds: 3),
    );

      }
 }


 // login function------------------------------------------------------------
  Future<void> login({
    required String email,
    required String password,
    String? fcmToken,
  }) async {
    try {
      loginLoading.value = true;

      // Call Login API from repo
      final response = await _registerRepo.login(
        email: email,
        password: password,
        fcmToken: fcmToken,
      );

      // Extract token and user data
      final String tokenValue = response["token"];
      final Map<String, dynamic> userData = response["user"];

      final int uid = userData["id"];
      final String uEmail = userData["email"];

      // Save Data to Storage
      await StorageService.saveToken(tokenValue);
      await StorageService.saveUserId(uid);
      await StorageService.saveUserData(userData);
      await StorageService.setLoggedIn(true);

      // Update Controller Variables
      token.value = tokenValue;
      userId.value = uid;
      userEmail.value = uEmail;

      loginLoading.value = false;

      // Success Snackbar
      Get.snackbar(
        "Success",
        response["message"] ?? "Login successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
//colorText: AppColors.textPrimary,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );

      // Navigate to Home Screen
      await Future.delayed(const Duration(milliseconds: 400));
      Get.to(HomeScreen_Api());
        } catch (e) {
      loginLoading.value = false;

      Get.snackbar(
        "Error",
        e.toString().replaceAll("Exception: ", ""),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
       // colorText: AppColors.textPrimary,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );
    }
  }

  //---------------------
// Post User Profile
//----------------------
  Future<void> saveProfile({required String userId, required String token, required String avatar}) async{
  try{
    postuerloading.value=true;
    final response=await _registerRepo.updateProfile(
        userId: userId,
        token: token,
        nickname: nicknameController.text,
        gender:selectedGender??"",
        bio: bioController.text,
        age: ageController.text,
        spokenLanguage: spokenLanguage??"",
        learningLanguage: learningLanguage??"",
        location: location,
        avatar: avatar);
    postuerloading.value=false;
    Get.snackbar(
      "Success",
      response['message'] ?? "Profile updated successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      duration: Duration(seconds: 3),
    );
  }
      catch(e){
        postuerloading.value = false;
        Get.snackbar(
          "Error",
          e.toString().replaceAll("Exception: ", ""),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 3),
        );
      }
  }

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      error("");

      final data = await _registerRepo.getProfile();
      if (data != null) {
        profileData.assignAll(data); //  CORRECT PLACE
      }
    } catch (e) {
      error.value = "Failed to load profile";
    } finally {
      isLoading(false);
    }
  }

  Future<void> refresh() async => fetchProfile();


}