import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/Appconstants/Url_constant.dart';

class GetallUserGrocery extends StatefulWidget {
  const GetallUserGrocery({super.key});

  @override
  State<GetallUserGrocery> createState() => _GetallUserGroceryState();
}

class _GetallUserGroceryState extends State<GetallUserGrocery> {
  bool isLoading = false;
  String error = '';
  List<Map<String, dynamic>> groceryUsers = [];
  groceryallUser() async {
    Dio dio = Dio();
    String groceryUrl = '${UrlConstant.gbaseurl}${UrlConstant.gendpoint}';
    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.get(groceryUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        // store list direcrt from api
        groceryUsers = List<Map<String, dynamic>>.from(data['groceryUsers']);
        setState(() {
          isLoading = false;
        });
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      error = e.toString();
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFE6ECF9), // background
          child: Stack(
            children: [
              // Top Blue Header
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    // gradient gives a darker diagonal area like the design
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0A47FF),
                        Color(0xFF00229B), // darker blue for diagonal effect
                        Color(0xFF0A47FF),
                      ],
                      stops: [0.0, 0.45, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // top row: menu + spacer + avatar (keeps avatar right aligned)
                        Row(
                          children: const [
                            Icon(Icons.menu, color: Colors.white, size: 26),
                            Spacer(),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person, color: Color(0xFF0A47FF), size: 22),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        // Title + subtitle
                        const Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Last Update 25 Feb 2020',
                          style: TextStyle(
                            color: Color(0xFFD9E0FF), // softer subtitle color
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // White curved container overlapping the header
              Positioned(
                left: 20,
                right: 20,
                top: 180, // controls overlap amount; tweak +/- to match screenshot
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 18,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  // leave this inner area empty (you said no grid inside)
                  child: const SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
