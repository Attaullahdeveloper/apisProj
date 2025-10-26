import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stat1proj/Apis/Inserteddata_fetched.dart';
import 'package:stat1proj/Grocery_api/Getall_user_grocery.dart';
 // 👈 next screen

class Grocerysplash extends StatefulWidget {
  const Grocerysplash({super.key});

  @override
  State<Grocerysplash> createState() => _GrocerysplashState();
}

class _GrocerysplashState extends State<Grocerysplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final box=GetStorage();

  @override
  // one time login checking
  ontimeLogin()async{
    GetStorage getStorage=GetStorage();
    String id=getStorage.read('user_id');
    if(id!=null){
      //  Read the other saved data
      String? name = box.read('name');
      String? year = box.read('year');
      String? price = box.read('price');
      String? cpuModel = box.read('cpuModel');
      String? hardDisk = box.read('hardDisk');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InserteddataFetched(
            name: name ?? 'Unknown',
            year: year ?? 'Unknown',
            price: price ?? 'Unknown',
            cpuModel: cpuModel ?? 'Unknown',
            hardDisk: hardDisk ?? 'Unknown',
          ),
        ),
      );
    }else{
      Get.snackbar('Error','The user did not found enter new data');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>GetallUserGrocery()));
    }
  }

  void initState() {
    super.initState();



    // 🔹 Simple fade animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // 🔹 Go to next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetallUserGrocery()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal, // ✅ Simple nice background
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: const Text(
              'Grocery APIs',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
