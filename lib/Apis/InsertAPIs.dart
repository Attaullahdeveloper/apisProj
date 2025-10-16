import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stat1proj/Apis/Inserteddata_fetched.dart';
class Insertapis extends StatefulWidget {
  const Insertapis({super.key});

  @override
  State<Insertapis> createState() => _InsertapisState();
}

class _InsertapisState extends State<Insertapis> {
bool  isLoading=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController yearController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController modelController=TextEditingController();
  TextEditingController harddiskController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      Column(
        children: [
          TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
          TextFormField(controller: yearController, decoration: InputDecoration(labelText: 'Year')),
          TextFormField(controller: priceController, decoration: InputDecoration(labelText: 'Price')),
          TextFormField(controller: modelController, decoration: InputDecoration(labelText: 'CPU Model')),
          TextFormField(controller: harddiskController, decoration: InputDecoration(labelText: 'Hard Disk Size')),
          const SizedBox(height: 30),
          TextButton(onPressed: ()
          async{
            String url='https://api.restful-api.dev/objects';
            final Map<String,dynamic>  requestbody={
            'name':nameController.text,
            'data':{
            'year':int.parse(yearController.text),
            'price':double.parse(priceController.text),
            'CPU model':modelController.text,
            'Hard disk size':harddiskController.text,
            }};
            Dio dio=Dio();
            GetStorage getStorage=GetStorage();
            try{
              setState(() {
                isLoading=true;

              });
              final response =await  dio.post(
                  url,
                  data:
                  requestbody);
             getStorage.write('user_id',  response.data['id']);
              setState(() {
                isLoading=false;
              });
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>InserteddataFetched(
                  name: response.data['name'],//nameController.text,
                  year: response.data['year'],
                  price: response.data['price'],
                  cpuModel: response.data['CPU model'],
                  hardDisk:response.data['Hard disk size'])));

            }
            catch(e){
              isLoading=false;
              setState(() {});
            }

          }, child:isLoading==true?CircularProgressIndicator(): Text('Insert data')),
        ],
      ),),
    );
  }
}
