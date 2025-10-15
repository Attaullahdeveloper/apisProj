import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';
class statecounterapp extends StatelessWidget {
  // here the class is stateless but changing its state------ this is called state management
  // bcs in state management we refresh the specific value of widget
   statecounterapp({super.key});
int count=0;
// obj will call here of the class counter controller class
  Statecontroller obj=Get.put(Statecontroller());
  // this is the class w ahve made in another dart file we made its obj here---------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(//simple app bar
             title: Text('State Counter app',style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
               color: Colors.red,
             ),),
             backgroundColor: Colors.teal,
           ),
      body: Column(
        children: [
          SizedBox(height: 50,),
         // obx is used for the changing the specific widget -----------------------
         Obx(()=> Text('${obj.count}',style: TextStyle(fontSize: 20),),),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed: (){
                obj.inc();
              },child: Icon(Icons.add),),
               SizedBox(width: 20,),
              FloatingActionButton(onPressed: (){
                obj.dec();
              },child: Icon(Icons.remove),),
              SizedBox(width: 20,),
              FloatingActionButton(onPressed: (){
                obj.ref();
              },child: Icon(Icons.refresh),),
            ],
          ),
          //---------------------------------
          SizedBox(height: 30,),
          Text('Switch button usinng state management',style: TextStyle(fontSize: 15),),
          Obx(()=>Switch(
              value: obj.isswitch.value,
              onChanged: (value){
                obj.isswitch.value=value;
              })),

        ],
      ),
    );
  }
}
