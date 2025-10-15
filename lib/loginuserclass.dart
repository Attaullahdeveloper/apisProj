import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginUser extends GetxController{
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();

  var isLoading=false.obs;

  loginfunc()async{
    isLoading.value=false;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(), password: passwordcontroller.text).
    // here .then is called when the user is successfully login
    then((onValue)async{
      // here we give the currect user id to varaible userId;
          String userId=await FirebaseAuth.instance.currentUser!.uid;
          await FirebaseFirestore.instance.collection('logindata').add({
            'userId':userId,
            'email':emailcontroller.text.trim(),
            'name':namecontroller.text,
          });
    });

  }
}