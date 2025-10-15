import 'package:get/get.dart';

class Statecontroller extends GetxController{
  var count=0.obs;
  var  i=1.obs;
 inc(){
   count.value++;
   // when we use the word obs then we have to write value with every varaible-------
 }
 dec(){
   if(count>0){
     count.value--;
   }
 }
 ref(){
   count.value=0;

 }
 var isswitch=true.obs;
 var isswitch2=false.obs;
 var isswitch3=false.obs;
 var isswitch4=false.obs;
}