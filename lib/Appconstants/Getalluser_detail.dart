import 'package:flutter/material.dart';
import 'Loading_widget.dart';

class GetalluserDetail extends StatefulWidget {
  final Map<String, dynamic> user;

  const GetalluserDetail({super.key, required this.user});

  @override
  State<GetalluserDetail> createState() => _GetalluserDetailState();
}

class _GetalluserDetailState extends State<GetalluserDetail> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate loading time (like data fetching)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user['image'] ?? ''),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text('${user['firstName']} ${user['lastName']}'),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
        child: AdvancedLoadingWidget(
          message: 'Loading user details...',
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Full Name: ${user['firstName']} ${user['lastName']}'),
            const SizedBox(height: 8),
            Text('Age: ${user['age']}'),
            const SizedBox(height: 8),
            Text('Gender: ${user['gender'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Email: ${user['email'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Phone: ${user['phone'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Username: ${user['username'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Birth Date: ${user['birthDate'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Height: ${user['height']}'),
            const SizedBox(height: 8),
            Text('Weight: ${user['weight']}'),
            const SizedBox(height: 8),
            Text('Eye Color: ${user['eyeColor'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Blood Group: ${user['bloodGroup'] ?? ''}'),
            const SizedBox(height: 8),
            Text('University: ${user['university'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Company Name: ${user['company']?['name'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Department: ${user['company']?['department'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Title: ${user['company']?['title'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Address: ${user['address']?['address'] ?? ''}'),
            const SizedBox(height: 8),
            Text('City: ${user['address']?['city'] ?? ''}'),
            const SizedBox(height: 8),
            Text('Postal Code: ${user['address']?['postalCode'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}
