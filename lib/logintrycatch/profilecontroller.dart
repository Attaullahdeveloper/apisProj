

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController{

  var userId=''.obs;
  var username=''.obs;
  var useremail=''.obs;



  insertuserdata()async{
    try
    {
    await FirebaseFirestore.instance.collection('Userdata').add({
      'userId':userId.value,
      'username':username.value,
      'useremail':useremail.value,
    });
    }
    catch(e)
    {

    }
  }


  getuserId()async{
    userId.value=await FirebaseAuth.instance.currentUser!.uid;
    useremail.value=await FirebaseAuth.instance.currentUser!.email??"";
  }
  fetchuserdata()async{
    try{
      final data=await FirebaseFirestore.instance.collection('Userdata').where('userId',isEqualTo: userId.value).get();
      if(data.docs.isNotEmpty){
        final userData=data.docs.first.data();
        username.value=userData['username'];
        useremail.value=userData['useremail'];
      }

    }
    catch(e){
print('--------------------$e');        

    }
    }
}