import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/Apis/InsertAPIs.dart';
import 'package:stat1proj/Appconstants/Getall_Users.dart';
import 'package:stat1proj/Appconstants/ender_id.dart';
import 'package:stat1proj/Collection_subCollection/fetch_screen.dart';
import 'package:stat1proj/Collection_subCollection/fetchstudent_screen.dart';
import 'package:stat1proj/Grocery_api/Grocery_splash.dart';
import 'package:stat1proj/Homeui_kit/smart_uikit.dart';
import 'package:stat1proj/circularbar.dart';
import 'package:stat1proj/firebase_options.dart';
import 'package:stat1proj/logintrycatch/RegisterScreen.dart';
import 'package:stat1proj/signup_signin_screen/signinscreen.dart';
import 'package:stat1proj/signup_signin_screen/signupscreen.dart';
import 'package:stat1proj/state_counterapp.dart';

import 'Apis/Inserteddata_fetched.dart';
import 'Apis/Insertsplash.dart';
import 'Apis/fetch_data.dart';
import 'Collection_subCollection/Insert_screen.dart';
import 'Grocery_api/Getall_user_grocery.dart';
import 'loginuser.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Grocerysplash()
    );
  }
}
