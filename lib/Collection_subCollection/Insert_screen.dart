import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stat1proj/Collection_subCollection/fetch_screen.dart';
class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController classNameCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: classNameCont,
          ),
          FloatingActionButton(onPressed: ()async{
            String classId=DateTime.now().millisecondsSinceEpoch.toString();
            await FirebaseFirestore.instance.collection('className').doc().set({
              'className':classNameCont.text,
              'classId':classId,
            }).then((onValue){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchScreen()));
            }).onError((handleError,error){});

          })

        ],
      ),
    );
  }
}
