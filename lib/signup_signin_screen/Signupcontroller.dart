
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/signup_signin_screen/signinscreen.dart';
import 'package:stat1proj/signup_signin_screen/userdatacontroller.dart';

import 'Hoomescreen.dart';
Userdatacontroller userdatacontroller=Get.put(Userdatacontroller());

class Signupcontroller extends GetxController{
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  var isLoading=false.obs;


  register()async{
    try
    {
      isLoading.value=true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(), password: passwordcontroller.text);
      userdatacontroller.Username.value=namecontroller.text;
    await userdatacontroller.getUserId();
     await userdatacontroller.insertUserdata();
      isLoading.value=false;
      Get.to(()=>signinscreen());

    }
    catch(e)
    {
      isLoading.value=false;
      print('-----------------------------------------');
      SnackBar(content: Text('error${e.toString()}'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),);

    }
  }
  login()async{
    isLoading.value=true;
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text).then((value){

      Get.to(()=>Hoomescreen());
      isLoading.value=false;
    }).onError((handleError,error){isLoading.value=false;});
  }
}