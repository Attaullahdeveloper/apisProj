import 'package:flutter/material.dart';

class HomeScreen_Api extends StatelessWidget {
  const HomeScreen_Api({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // USER PROFILE CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  const SizedBox(width: 16),

                  // NAME + EMAIL
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "User Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "useremail@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3 DOT MENU
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == "update") {
                        print("Update profile clicked");
                      } else if (value == "delete") {
                        print("Delete profile clicked");
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "update",
                        child: Text("Update Profile"),
                      ),
                      const PopupMenuItem(
                        value: "delete",
                        child: Text(
                          "Delete Profile",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // HOME SCREEN TITLE
            const Text(
              "Home Screen",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // API CARDS
            _apiCard("Register API", "User register through name, email & password"),
            _apiCard("Send OTP", "Send OTP to registered email"),
            _apiCard("Verify OTP", "Verify OTP after registration"),
            _apiCard("Login API", "Login using email & password"),
            _apiCard("Get Profile API", "Fetch user profile info"),
            _apiCard("Update Profile API", "Update user image, name, email"),
            _apiCard("Logout API", "End user session"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // REUSABLE API CARD WIDGET
  Widget _apiCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.api, color: Colors.blue.shade800, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
