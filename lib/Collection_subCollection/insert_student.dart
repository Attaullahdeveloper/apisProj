import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class InsertStudent extends StatefulWidget {
  final String classId;
  const InsertStudent({super.key,required this.classId});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  TextEditingController stNameCont=TextEditingController();
  TextEditingController strollCont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: stNameCont,
          ),
          TextFormField(
            controller: strollCont,
          ),
          FloatingActionButton(onPressed: ()async{
            await FirebaseFirestore.instance.collection('className').doc(widget.classId).collection('stNames').doc(strollCont.text).set({
              'stName':stNameCont.text,
              'stRoll':strollCont.text,
            }).then((onValue){Navigator.pop(context);});
          },child: Text('addSt'),)

        ],
      ),
    );
  }
}
