import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/Appconstants/Rowwidget.dart';
import 'package:stat1proj/Appconstants/Url_constant.dart';
class GetallUsers extends StatefulWidget {
  const GetallUsers({super.key});

  @override
  State<GetallUsers> createState() => _GetallUsersState();
}

class _GetallUsersState extends State<GetallUsers> {
  bool isLoading=false;
  String error='';
  List<Map<String, dynamic>> users = [];
 fetchalldata()async{
   Dio dio=Dio();
   String getUrl= '${UrlConstant.baseurl}${UrlConstant.getallUsers}';
   print('---------------------------------try----------------------------');
   try{
     setState(() {
       isLoading=true;
     });
     final response=await dio.get(getUrl);
     if(response.statusCode==200 || response.statusCode==201){
       final data=response.data;
       // store the list of users direct from JSON
       users=List<Map<String,dynamic>>.from(data['users']);
       setState(() {
         isLoading=false;
       });
     }else{
       Get.snackbar('Error','Failed to fetch data');
       setState(() {
         isLoading=false;
       });
     }

   }
       catch(e){
     error=e.toString();
     setState(() {
       isLoading=false;
     });
       }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetching all Users',),backgroundColor: Colors.orange,),
      body:   isLoading?Center(child: CircularProgressIndicator()):
      error!=''?Center(
        child: Column(
          children: [
            Text('Error:$error'),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              fetchalldata();
            }, child:Center(child: Text('Retry'),))
          ],
        ),
      ):ListView.builder(
        padding: EdgeInsets.all(16),
          itemCount: users.length,
          itemBuilder: (context,index) {
          final user=users[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user['image']??''),
                  radius: 40,
                ),
                SizedBox(height: 20,),
                //  Use RowWidget with index-based user data
                InfoRow(title: 'First Name', value: user['firstName'] ?? ''),
                InfoRow(title: 'Last Name', value: user['lastName'] ?? ''),
                InfoRow(title: 'Maiden Name', value: user['maidenName'] ?? ''),
                InfoRow(title: 'Age', value: user['age'].toString()),


              ],
            ),
          );
          }),
    );
  }
}
