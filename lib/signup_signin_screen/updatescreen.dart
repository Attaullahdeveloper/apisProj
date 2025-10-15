import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/signup_signin_screen/userdatacontroller.dart';
class Updatescreen extends StatelessWidget {
   Updatescreen({super.key});

  @override
  Userdatacontroller userdatacontroller=Get.put(Userdatacontroller());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Profile")),
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
            controller: userdatacontroller.nameController,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: userdatacontroller.ageController,
            decoration: InputDecoration(
              hintText: 'Age',
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: userdatacontroller.phoneController,
            decoration: InputDecoration(
              hintText: 'Phone',
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: userdatacontroller.genderController,
            decoration: InputDecoration(
              hintText: 'Gender',
            ),
          ),
          SizedBox(height: 20,),

          FloatingActionButton(onPressed: ()async{
            await userdatacontroller.Updateuserdata();
            await userdatacontroller.fetchUserdata();
            Navigator.pop(context);//to home screen--------------------------------------

          },child: Text('Update'),)




        ],
      ),


    );
  }
}
