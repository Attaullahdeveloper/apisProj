import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/GetxAPis/controller/get_controller.dart';
import 'package:stat1proj/Getx_single_multi_byid_Apis/refresh_icon_animation.dart';

import '../../Appconstants/Loading_widget.dart';
import '../../Getx_single_multi_byid_Apis/icon_animation.dart';
class Getscreen extends StatelessWidget {
  const Getscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Getdata getdata= Get.put(Getdata());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Single User APIs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3), // Light Blue
                Color(0xFF1565C0), // Deep Blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),


      body:
      Obx(() {
        if (getdata.Loaging.value) {
          return const Center(
            child: AdvancedLoadingWidget(message: 'Loading'),
          );
        } if(getdata.user.isEmpty){
          return Center(child: AdvancedLoadingWidget(message: 'No data found',),);
        }
      return Padding(padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.center,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
            radius:   50,
          backgroundImage: NetworkImage(getdata.user['image']??''),
        ),
          const SizedBox(height: 20),

          // User info fields
          Text(" Name: ${getdata.user['firstName']} ${getdata.user['lastName']}",
          style: const TextStyle(fontSize: 18)),
          Text(" Email: ${getdata.user['email']}",
          style: const TextStyle(fontSize: 16)),
          Text(" Phone: ${getdata.user['phone']}",
          style: const TextStyle(fontSize: 16)),
          Text(" Age: ${getdata.user['age']}",
          style: const TextStyle(fontSize: 16)),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 52,
                  width: 250,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2196F3), // Light Blue
                        Color(0xFF1565C0), // Deep Blue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Get All Users',style: TextStyle(color: Colors.white),),
                      InkWell(
                        onTap: (){
                          getdata.getxfetchusers();
                        },
                        child: Container(
                          // color: Colors.blue,
                            height: 40,
                            width: 40,
                            child: Refresh_icon_animted()),
                      ),
                    ],),
                ),
              ),
          ],
        ),
      ),);
      }),

    );
  }
}
