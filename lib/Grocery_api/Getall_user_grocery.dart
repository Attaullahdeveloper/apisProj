import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stat1proj/Appconstants/Loading_widget.dart';
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
      print(" Response Status: ${response.statusCode}");
      print(" Response Data: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        // store list direcrt from api
        setState(() {
          groceryUsers = List<Map<String, dynamic>>.from(data['groceryUsers']);
          isLoading = false;
        });
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(" Exception: $e");
      error = e.toString();
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    groceryallUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
      body: Stack(
        children: [
          // 🔵 Blue background gradient
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0A47FF),
                  Color(0xFF00229B),
                  Color(0xFF0A47FF),
                ],
                stops: [0.0, 0.45, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // ⚪ White curved section with grid
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        color: Color(0xFFD9E0FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // White curved container with grid
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child:isLoading?CircularProgressIndicator(): GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: groceryUsers.length,
                      itemBuilder: (context, index) {
                        final guserVariable=groceryUsers[index];
                        return
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 🖼 Image
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    guserVariable['image'] ?? 'https://via.placeholder.com/150',
                                    height: 90,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // 🧾 Name
                                Text(
                                  guserVariable['name'] ?? 'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 4),

                                // 🍽 Cuisine
                                Text(
                                guserVariable['cuisine'] ?? 'No cuisine info',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const Spacer(),

                                // ⭐ Rating
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 18),
                                    const SizedBox(width: 4),
                                    Text(
                                      guserVariable['rating']?.toString() ?? '0.0',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),
                              ],
                            ),
                          );

                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),



    );
  }
}
