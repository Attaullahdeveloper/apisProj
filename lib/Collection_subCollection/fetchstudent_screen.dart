import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stat1proj/Collection_subCollection/Insert_screen.dart';
import 'package:stat1proj/Collection_subCollection/fetchstudent_screen.dart';
import 'package:stat1proj/Collection_subCollection/insert_student.dart';
class Fetchstudent extends StatelessWidget {
  final String classId;
  const Fetchstudent({super.key,required this.classId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>InsertStudent(classId: classId)));
      }),
      appBar: AppBar(title: Text('Students'),),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('className').doc(classId).collection('stNames').snapshots(),
        builder:  (context,snapshot) {
          final classes=snapshot.data!.docs;
          return ListView.builder(
            itemCount:classes.length,
            itemBuilder: (context,index){
              final classData=classes[index].data()as Map<String,dynamic>;
              return Card(
                color: Colors.yellow,
                child:  ListTile(
                  title: Text(classData['stName']??''),
                  subtitle: Text("Rol No:${classData['stRoll']}"),
                  // onTap: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>InsertStudent(classId: 'className')));
                  // },
                ),
              );

            },
          );
        },
      ),
    );
  }
}
