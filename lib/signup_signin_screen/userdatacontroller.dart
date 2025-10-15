import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Userdatacontroller extends GetxController{

  var UserId=''.obs;
  var Username=''.obs;
  var Useremail=''.obs;
  var Userphone=''.obs;
  var Userage=''.obs;
  var Usergender=''.obs;

  insertUserdata()async {
    try {
      await FirebaseFirestore.instance.collection('UserData').doc(UserId.value).set({
        'UserId':UserId.value,
        'Username':Username.value,
        'Useremail':Useremail.value,
        'Userphone':Userphone.value,
        'Userage':Userage.value,
        'Usergender':Usergender.value,

      });

    }
    catch (e) {}
  }
  getUserId()async{
     UserId.value=await FirebaseAuth.instance.currentUser!.uid;
     Useremail.value=await FirebaseAuth.instance.currentUser!.email??"";
  }

  fetchUserdata()async{
    try
        {
          final data=await FirebaseFirestore.instance.collection('UserData').where('UserId',isEqualTo: UserId.value).get();
          if(data.docs.isNotEmpty){
            final userdata=data.docs.first.data();
            Username.value=userdata['Username'];
            Useremail.value=userdata['Useremail'];
          }
        }
        catch(e){
      print('-----------------------------------------$e');
        }

  }
  TextEditingController phoneController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  Updateuserdata()async{
    await FirebaseFirestore.instance.collection('UserData').doc(UserId.value).update(
        {
          'Userphone':phoneController.value,
          'Userage':phoneController.value,
          'Usergender':phoneController.value,
          'Username':nameController.value,
        });

  }


}