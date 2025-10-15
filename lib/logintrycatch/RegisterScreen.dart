import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/logintrycatch/registercontroller.dart';
class Registerscreen extends StatelessWidget {
   Registerscreen({super.key});
  ResgisterController resgisterController=Get.put(ResgisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(16),
             child: TextFormField(
                controller: resgisterController.emailcontroller,
               decoration: InputDecoration(
                 hintText: 'Enter your email'
               ),
              ),
           ),
           Padding(
             padding: const EdgeInsets.all(16),
             child: TextFormField(
                controller: resgisterController.namecontroller,
               decoration: InputDecoration(
                 hintText: 'Enter your name',
               ),
              ),
           ),

         Padding(
           padding: const EdgeInsets.all(16),
           child: TextFormField(
                controller: resgisterController.passwordcontroller,
             decoration: InputDecoration(
               hintText: 'Enter your password',
             ),
              ),
         ),

          Obx((){
            return resgisterController.isLoading==true?CircularProgressIndicator():
            FloatingActionButton(onPressed: (){
              resgisterController.register();

            },
              child: Center(child: Icon(Icons.add),),
            );
          })

        ],
      ),
    );
  }
}
