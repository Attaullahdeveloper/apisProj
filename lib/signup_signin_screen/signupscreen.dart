import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/signup_signin_screen/Signupcontroller.dart';
class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});


  @override
  Widget build(BuildContext context) {
    Signupcontroller signupcontroller=Signupcontroller();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text('Create your account',style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: signupcontroller.namecontroller,
              style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter your name',
              hintStyle: TextStyle(color: Colors.white),
            ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: signupcontroller.emailcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: signupcontroller.passwordcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 50,),
       Obx((){
         return signupcontroller.isLoading.value==true?CircularProgressIndicator():   InkWell(
           onTap: (){
             signupcontroller.register();
           },
           child: Container(
             height: 50,
             width: 150,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                 color:Colors.yellow
             ),
             child: Center(child: Text('Create',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
               ),
         );
       }),
        ],
      ),
    );
  }
}
