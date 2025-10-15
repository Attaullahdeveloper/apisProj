import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/signup_signin_screen/updatescreen.dart';
import 'package:stat1proj/signup_signin_screen/userdatacontroller.dart';
class Hoomescreen extends StatelessWidget {
   Hoomescreen({super.key});

  @override
  Userdatacontroller userdatacontroller=Get.put(Userdatacontroller());
  Widget build(BuildContext context) {
    userdatacontroller.getUserId();
    userdatacontroller.fetchUserdata();

    return Scaffold(
      appBar: AppBar(
        title:    Text('Home scren',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),

      ),
      body:
    Obx(()=>  Column(
      children: [
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.black,),
          title: Text(userdatacontroller.Username.toString()),
          subtitle: Text(userdatacontroller.Useremail.toString()),
        ),
        SizedBox(height: 50,),
        TextButton(onPressed: (){
          Get.to(Updatescreen());
        }, child:Text('Update')),


      ],
    ),)
    );
  }
}
