import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/Appconstants/Url_constant.dart';
import 'package:stat1proj/Appconstants/ender_id.dart';
class FetchData extends StatefulWidget {
  final int id;
  const FetchData({super.key,required this.id});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  @override
  bool isLoading=false;
  int id=0;
  String firstname='';
  String lastname='';
  String midname='';
  int age=0;
  String gender='';
  String email='';
  String phone='';
  String username='';
  String pass='';
  String birthday='';
  //------------------------------
  String image='';
 String haircolor='';
 String hairtypr='';
 String error='';


  void fetchdata()async{
 try{
   isLoading=true;
   setState(() {

   });
   Dio dio=Dio();
   UrlConstant.userid=widget.id;
   final detail=await dio.get('${UrlConstant.baseurl}${UrlConstant.endpoint}',);
   //---------Using url method-----------
   firstname=detail.data['firstName'];
   lastname=detail.data['lastName'];
   midname=detail.data['maidenName'];
   age=detail.data['age'];
   image=detail.data['image'];
   gender=detail.data['gender'];
   email=detail.data['email'];
   phone=detail.data['phone'];
   username=detail.data['username'];
   pass=detail.data['password'];
   birthday=detail.data['birthDate'];
   image=detail.data['image'];
   haircolor=detail.data['hair']['color'];
   hairtypr=detail.data['hair']['type'];
   setState(() {
     isLoading=false;

   });
 }
     catch(e){
   setState(() {
     Get.snackbar('Error','fetching error$e');

   });
   print('Error in code $e');
     }
  }
  void initState() {
    // TODO: implement initState
    fetchdata();

  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
         
        });
        Get.to(Enterid());
      },child: Icon(Icons.arrow_left),),
      body:
      isLoading==true?Center(child: CircularProgressIndicator()):
          error!=''?Center(
            child: Column(
              children: [
                Text('Error:$error'),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  fetchdata();
                }, child:Center(child: Text('Retry'),))
              ],
            ),
          ):
          Card(
            color: Colors.orange[200],
            margin: const EdgeInsets.all(20),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(image),
                  ),
                  const SizedBox(height: 20),
                  Text("First Name: $firstname"),
                  Text("Last Name: $lastname"),
                  Text("Middle Name: $midname"),
                  Text("Age: $age"),
                  Text("Gender: $gender"),
                  Text("Email: $email"),
                  Text("Phone: $phone"),
                  Text("Username: $username"),
                  Text("Password: $pass"),
                  Text("Birth Date: $birthday"),
                  Text("Hair Color: $haircolor"),
                  Text("Hair Type: $hairtypr"),
                ],
              ),
            ),
          )


    );
  }
}
