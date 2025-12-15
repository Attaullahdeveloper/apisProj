// lib/views/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat1proj/Sign_up_Sign_in_Apis/Controller/Register_controller.dart';

class Get_screen extends StatelessWidget {
  Get_screen({super.key});

  // 🔹 Controller instance
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      // 🔹 Obx listens to controller Rx variables
      body: Obx(() {
        // ===========================
        // 🔹 FUNCTION USED:
        // c.fetchProfile() → called in controller.onInit()
        // c.isLoading → checked here
        // ===========================
        if (_registerController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // ===========================
        // 🔹 ERROR HANDLING
        // ===========================
        if (_registerController.profileData.isEmpty) {
          return const Center(child: Text("No profile data found"));
        }

        // ===========================
        // 🔹 DATA USED FROM:
        // profileData.assignAll(data)
        // ===========================
        final data = _registerController.profileData['data'];
        final profile = data['profile'];
        final purchases = (data['purchased_items'] ?? []) as List<dynamic>;

        return RefreshIndicator(
          // ===========================
          // 🔹 FUNCTION USED:
          // c.refresh() → calls fetchProfile()
          // ===========================
          onRefresh: _registerController.refresh,

          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // ===========================
                // 🔹 PROFILE IMAGE
                // ===========================
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: Image.network(
                            data['profile_image_url'] ?? "",
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Icon(Icons.person,
                                  size: 70, color: Colors.grey[600]);
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const CircularProgressIndicator();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 22),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  profile['nickname'] ?? "-",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                if (data['is_vip'] == true)
                  const Chip(
                    backgroundColor: Colors.amber,
                    label: Text(
                      "VIP Member",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                const SizedBox(height: 30),

                // ===========================
                // 🔹 INFO CARDS
                // ===========================
                _card("Name", profile['nickname'] ?? "-"),
                _card("Gender", _capitalize(profile['gender'])),
                _card("Age", "${profile['age'] ?? '-'} years"),
                _card("Location", profile['location'] ?? "-"),
                _card("Bio", profile['bio'] ?? "No bio added"),

                // ===========================
                // 🔹 LANGUAGES
                // ===========================
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Spoken Languages",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: (profile['spoken_languages'] ?? [])
                            .map<Widget>(
                                (e) => Chip(label: Text(e.toString())))
                            .toList(),
                      ),

                      const SizedBox(height: 20),
                      const Text("Learning Languages",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: (profile['learning_languages'] ?? [])
                            .map<Widget>((e) => Chip(
                          label: Text(e.toString()),
                          backgroundColor: Colors.green[100],
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),

                // ===========================
                // 🔹 STATS
                // ===========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _stat("${data['followers'] ?? 0}", "Followers"),
                    _stat("${data['following'] ?? 0}", "Following"),
                    _stat("${data['visitors'] ?? 0}", "Visitors"),
                  ],
                ),

                const SizedBox(height: 30),

                // ===========================
                // 🔹 PURCHASED ITEMS
                // ===========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text("Purchased Items",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),

                ...purchases.map((item) => Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 6),
                  child: ListTile(
                    title: Text(item['title'] ?? ""),
                    subtitle:
                    Text("${item['category']} • \$${item['price']}"),
                  ),
                )),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      }),
    );
  }

  // ===========================
  // 🔹 HELPER WIDGETS
  // ===========================
  Widget _card(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style:
                  TextStyle(color: Colors.grey[600], fontSize: 14)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
          const Icon(Icons.arrow_forward_ios,
              size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  String _capitalize(String? text) {
    if (text == null || text.isEmpty) return "-";
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
