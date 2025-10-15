

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/logintrycatch/profilecontroller.dart';
Profilecontroller profilecontroller=Profilecontroller();
class ResgisterController extends GetxController{

  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  var isLoading=false.obs;



  register()async{
    try
        {
          isLoading.value=true;
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text.trim(), password:passwordcontroller.text);
          profilecontroller.username.value=namecontroller.text;
           profilecontroller.getuserId();
           profilecontroller.insertuserdata();
          isLoading.value=false;
        }



    catch(error)
    {
      isLoading.value=false;
      print('-----------------------------------------');
     SnackBar(content: Text('error${error.toString()}'),
     backgroundColor: Colors.red,
       duration: Duration(seconds: 3),);

    }

}
}