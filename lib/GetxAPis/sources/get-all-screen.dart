import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/Appconstants/Loading_widget.dart';

import '../controller/get_controller.dart';
class Getallscreen extends StatelessWidget {
  const Getallscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Getdata getdata= Get.put(Getdata());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX All User APIs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3), // Light Blue
                Color(0xFF1565C0), // Deep Blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
 body: Obx(() {
   if(getdata.Loaging.value){
     return AdvancedLoadingWidget(message: 'Loading data',);
   }
   if(getdata.alluser.isEmpty){
     return Center(child: AdvancedLoadingWidget(message: 'No data found',),);
   }
   PageController pageController = PageController(viewportFraction: 0.85);
  // returnPageController pageController = PageController(viewportFraction: 0.85); // Controller for PageView with partial next/prev cards

 return  PageView.builder(
     controller: pageController, // ✅ Attach controller for animation
     itemCount: getdata.alluser.length, // Total number of users
     itemBuilder: (context, index) {
       final user = getdata.alluser[index]; // Get user data at this index

       return AnimatedBuilder(
         animation: pageController, // ✅ Listen to page scroll changes
         builder: (context, child) {
           double value = 1.0;
           if (pageController.position.haveDimensions) {
             value = pageController.page! - index; // ✅ Difference between current page and this page
             value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0); // ✅ Scale value for image animation
           }

           return Container(
             margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10), // Card spacing
             padding: const EdgeInsets.all(16), // Inner padding
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               gradient: const LinearGradient(
                 colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
               ),
               boxShadow: const [
                 BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 6)), // Shadow for elevation
               ],
             ),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   // ✅ Animated Image
                   Transform.scale(
                     scale: value, // ✅ Scale image based on scroll position
                     child: CircleAvatar(
                       radius: 50,
                       backgroundImage: NetworkImage(user['image'] ?? ''), // User image
                     ),
                   ),
                   const SizedBox(height: 16), // Space
                   Text(
                     '${user['firstName']} ${user['lastName']}', // User full name
                     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                   ),
                   const SizedBox(height: 8),
                   Text('Email: ${user['email'] ?? ''}', style: const TextStyle(color: Colors.white70)),
                   Text('Phone: ${user['phone'] ?? ''}', style: const TextStyle(color: Colors.white70)),
                   Text('Age: ${user['age'] ?? ''}', style: const TextStyle(color: Colors.white70)),
                 ],
               ),
             ),
           );
         },
       );
     },
   );



 }),
    );
  }
}
