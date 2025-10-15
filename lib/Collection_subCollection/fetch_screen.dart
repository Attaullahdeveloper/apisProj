import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stat1proj/Collection_subCollection/Insert_screen.dart';
import 'package:stat1proj/Collection_subCollection/fetchstudent_screen.dart';
import 'package:stat1proj/Collection_subCollection/insert_student.dart';
class FetchScreen extends StatelessWidget {
  const FetchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InsertScreen()));
      }),
      appBar: AppBar(title: Text('Courses'),),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('className').snapshots(),
        builder:  (context,snapshot) {
          final classes=snapshot.data!.docs;
          return ListView.builder(
              itemCount:classes.length,
          itemBuilder: (context,index){
                final classData=classes[index].data()as Map<String,dynamic>;
                String id=classData['classId'];
                return Card(
                  color: Colors.yellow,
                child:  ListTile(
                  title: Text(classData['className']??''),
                  subtitle: Text("ID:${classData['classId']}"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Fetchstudent(classId: id)));
                  },
                ),
                );

          },
          );
        },
      ),
    );
  }
}
