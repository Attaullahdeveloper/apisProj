
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/loginuserclass.dart';
class loginuser extends StatelessWidget {
  loginuser({super.key});

  @override
  LoginUser loginUser=Get.put(LoginUser());
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
          ()=> Container(
            height: 30,
            width: 30,
            child: TextFormField(
                controller: loginUser.namecontroller,
              ),
          ),
          ),
          TextFormField(
            controller: loginUser.emailcontroller,
          ),
          TextFormField(
            controller: loginUser.passwordcontroller,
          ),
          Obx((){
           return loginUser.isLoading==true?CircularProgressIndicator():
                FloatingActionButton(onPressed: (){
                  loginUser.loginfunc();
                });
          })

        ],
      ),

    );
  }
}
