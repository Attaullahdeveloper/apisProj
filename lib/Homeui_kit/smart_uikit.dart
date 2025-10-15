import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stat1proj/Homeui_kit/cutom_switchbutton.dart';
import 'package:stat1proj/appimages.dart';


import '../controller.dart';
class smartuiview extends StatelessWidget {
   smartuiview({super.key});
   Statecontroller obj=Get.put(Statecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD4E2FD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(color: Colors.black,width: 2)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Padding (
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('May 16,2025',style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xff6F7EA8),

                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [

                      Text('Smart home',style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff07123C),

                      ),),
                      Spacer(),
                      Stack(
                        children:[ CircleAvatar(
                          radius: 25,
                          backgroundColor:Colors.grey.shade200,
                          child: Center(
                            child: Icon(Icons.person),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(left:38,top: 5),
                            child: Container(height: 12,width: 12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.greenAccent
                              ),),
                          ),
                  ],
                      ),
                      SizedBox(width: 15,),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      Container(height: 10,width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.greenAccent
                      ),),
                      SizedBox(width: 10,),
                      Text('20 devices running',style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xff07123C),

                      ),),
                    ],
                  ),
                ),
                // first cont-------------------------------------------

              ],
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                Obx(()=>
                    TextButton(onPressed: (){
                  obj.i.value=1;
                }, child:  Text('Living Room',style: GoogleFonts.inter(
                  fontSize: 14,fontWeight: FontWeight.bold,
                  color:obj.i.value==1?Color(0xff2666DE):Color(0xff6F7EA8),

                ),),),),
                  Obx(()=>
                      TextButton(onPressed: (){
                        obj.i.value=2;
                      }, child:  Text('Kitchen',style: GoogleFonts.inter(
                        fontSize: 14,fontWeight: FontWeight.bold,
                        color:obj.i.value==2?Color(0xff2666DE):Color(0xff6F7EA8),

                      ),),),),
                  Obx(()=>
                      TextButton(onPressed: (){
                        obj.i.value=3;
                      }, child:  Text('Drawing Room',style: GoogleFonts.inter(
                        fontSize: 14,fontWeight: FontWeight.bold,
                        color:obj.i.value==3?Color(0xff2666DE):Color(0xff6F7EA8),

                      ),),),),
                  Obx(()=>
                      TextButton(onPressed: (){
                        obj.i.value=4;
                      }, child:  Text('Dinning Room',style: GoogleFonts.inter(
                        fontSize: 14,fontWeight: FontWeight.bold,
                        color:obj.i.value==4?Color(0xff2666DE):Color(0xff6F7EA8),

                      ),),),),
                ],
              ),
            ),
          ),
          //--------------------------contaienrs-----------------
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child:
                //----------------------------------------first 2 container--------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Obx(()=>Container(
                  height: 160,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:obj.isswitch.value?Color(0xff2666DE):Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Row(
                          children: [
                            Image.asset(appimages.sm1,color: obj.isswitch.value?Color(0xffFFFFFF):Color(0xff6F7EA8),),
                            SizedBox(width: 50,),
                            // FlutterSwitch(
                            //   width: 42.0,
                            //   height: 22.0,
                            //   toggleSize: 18.0,
                            //   borderRadius: 30.0,
                            //   padding: 2.0,
                            //   activeColor: Colors.blue,
                            //   inactiveColor: Colors.grey.shade300,
                            //   value: obj.isswitch.value,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // )
                            Obx(() =>
                            // FlutterSwitch(
                            //   width: 35.0, // Approx 20 mm
                            //   height: 17.0, // Approx 8 mm
                            //   toggleSize: 25.0, // Approx 5 mm
                            //   value: obj.isswitch.value,
                            //  padding: 0.0,
                            //  borderRadius:15, // Rounded track
                            //   activeColor: Color(0xff2666DE),
                            //   inactiveColor: Colors.grey.shade300,
                            //   toggleColor: Colors.white,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // ),// switch button code by the flutter package
                            CustomSwitch(
                                value: obj.isswitch.value,
                                onChanged: (value){
                                  obj.isswitch.value=value;
                                })),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding (
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Smart TV',style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Panasonic',style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                    ],
                  ),
                ),),
                SizedBox(width: 2,),
                Obx(()=>Container(
                  height: 160,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:obj.isswitch2.value?Color(0xff2666DE):Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Row(
                          children: [
                            Image.asset(appimages.sm2,color: obj.isswitch2.value?Color(0xffFFFFFF):Color(0xff6F7EA8),),
                            SizedBox(width: 50,),
                            // FlutterSwitch(
                            //   width: 42.0,
                            //   height: 22.0,
                            //   toggleSize: 18.0,
                            //   borderRadius: 30.0,
                            //   padding: 2.0,
                            //   activeColor: Colors.blue,
                            //   inactiveColor: Colors.grey.shade300,
                            //   value: obj.isswitch.value,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // )
                            Obx(() =>
                                // FlutterSwitch(
                                //   width: 35.0, // Approx 20 mm
                                //   height: 17.0, // Approx 8 mm
                                //   toggleSize: 25.0, // Approx 5 mm
                                //   value: obj.isswitch.value,
                                //  padding: 0.0,
                                //  borderRadius:15, // Rounded track
                                //   activeColor: Color(0xff2666DE),
                                //   inactiveColor: Colors.grey.shade300,
                                //   toggleColor: Colors.white,
                                //   onToggle: (value) {
                                //     obj.isswitch.value = value;
                                //   },
                                // ),// switch button code by the flutter package
                              CustomSwitch(
                                  value: obj.isswitch2.value,
                                  onChanged: (value){
                                    obj.isswitch2.value=value;
                                  })
                               ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding (
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Smart TV',style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch2.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Panasonic',style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch2.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                    ],
                  ),
                ),),
                SizedBox(width: 10,),
              ],
            ),
          ),
          SizedBox(height: 14,),
          //--------------------------------------------2nd two container------------------------
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Obx(()=>Container(
                  height: 160,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:obj.isswitch3.value?Color(0xff2666DE):Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Row(
                          children: [
                            Image.asset(appimages.sm3,color: obj.isswitch3.value?Color(0xffFFFFFF):Color(0xff6F7EA8),),
                            SizedBox(width: 50,),
                            // FlutterSwitch(
                            //   width: 42.0,
                            //   height: 22.0,
                            //   toggleSize: 18.0,
                            //   borderRadius: 30.0,
                            //   padding: 2.0,
                            //   activeColor: Colors.blue,
                            //   inactiveColor: Colors.grey.shade300,
                            //   value: obj.isswitch.value,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // )
                            Obx(() =>
                            // FlutterSwitch(
                            //   width: 35.0, // Approx 20 mm
                            //   height: 17.0, // Approx 8 mm
                            //   toggleSize: 25.0, // Approx 5 mm
                            //   value: obj.isswitch.value,
                            //  padding: 0.0,
                            //  borderRadius:15, // Rounded track
                            //   activeColor: Color(0xff2666DE),
                            //   inactiveColor: Colors.grey.shade300,
                            //   toggleColor: Colors.white,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // ),// switch button code by the flutter package
                            CustomSwitch(
                                value: obj.isswitch3.value,
                                onChanged: (value){
                                  obj.isswitch3.value=value;
                                })),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding (
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Wi-Fi Router',style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch3.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text('TP Link',style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch3.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                    ],
                  ),
                ),),
                SizedBox(width: 2,),
                Obx(()=>Container(
                  height: 160,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:obj.isswitch4.value?Color(0xff2666DE):Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Row(
                          children: [
                            Image.asset(appimages.sm4,color: obj.isswitch4.value?Color(0xffFFFFFF):Color(0xff6F7EA8),),
                            SizedBox(width: 50,),
                            // FlutterSwitch(
                            //   width: 42.0,
                            //   height: 22.0,
                            //   toggleSize: 18.0,
                            //   borderRadius: 30.0,
                            //   padding: 2.0,
                            //   activeColor: Colors.blue,
                            //   inactiveColor: Colors.grey.shade300,
                            //   value: obj.isswitch.value,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // )
                            Obx(() =>
                            // FlutterSwitch(
                            //   width: 35.0, // Approx 20 mm
                            //   height: 17.0, // Approx 8 mm
                            //   toggleSize: 25.0, // Approx 5 mm
                            //   value: obj.isswitch.value,
                            //  padding: 0.0,
                            //  borderRadius:15, // Rounded track
                            //   activeColor: Color(0xff2666DE),
                            //   inactiveColor: Colors.grey.shade300,
                            //   toggleColor: Colors.white,
                            //   onToggle: (value) {
                            //     obj.isswitch.value = value;
                            //   },
                            // ),// switch button code by the flutter package
                            CustomSwitch(
                                value: obj.isswitch4.value,
                                onChanged: (value){
                                  obj.isswitch4.value=value;
                                })),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding (
                        padding: const EdgeInsets.only(left:20),
                        child: Text('Wi-Fi Router',style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch4.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text('TP Link',style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: obj.isswitch4.value?Color(0xffFFFFFF):Color(0xff6F7EA8),

                        ),),
                      ),
                    ],
                  ),
                ),),
                SizedBox(width: 10,),
              ],
            ),
          ),
          //=============================================last container--------------------------------------------
          Spacer(),
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff2666DE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              //  border: Border.all(color: Colors.black,width: 2)
            ),
            child:
            Stack(
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 300),
                  child: FloatingActionButton(
                  onPressed: () {},
                              backgroundColor: Color(0xffFFFFFF),
                              shape: const CircleBorder(), // Ensures it's perfectly circular
                              child: const Icon(Icons.arrow_forward, size: 25, color: Color(0xff2666DE)),
                            ),
                ),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Quick Remote access',style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold

                    ),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Turn right to get fast access to your \n'
                        'wireless remote access',style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xffD4E2FD),
                       // fontWeight: FontWeight.bold

                    ),),
                  ),

                ],
              ),
            ]
            ),
          ),
        ],
      ),
    );
  }
}
