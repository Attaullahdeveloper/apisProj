import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat1proj/GetxAPis/sources/get-all-screen.dart';
import 'package:stat1proj/GetxAPis/sources/get-screen.dart';

import 'icon_animation.dart';
class Buttonscreen extends StatelessWidget {
  const Buttonscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Single-Multi-byId User APIs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        flexibleSpace:
        Container(
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
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 160,),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>Getscreen()));
              },
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
                  Text('Get Single User',style: TextStyle(color: Colors.white),),
               //   SizedBox(width: 10,),
                    Container(
                      // color: Colors.blue,
                        height: 40,
                        width: 40,
                        child: SimpleIconAnimation()),
                ],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>Getallscreen()));
              },
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
                    Container(
                      // color: Colors.blue,
                        height: 40,
                        width: 40,
                        child: SimpleIconAnimation()),
                ],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 60),
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
                  Text('Get User by Id',style: TextStyle(color: Colors.white),),
// icon animation---------
                  Container(
                   // color: Colors.blue,
                      height: 40,
                      width: 40,
                      child: SimpleIconAnimation()),
                ],),
            ),
          ),

        ],
      ),
    );
  }
}
