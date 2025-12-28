import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SimpleLocationScreen extends StatefulWidget {
  const SimpleLocationScreen({super.key});

  @override
  State<SimpleLocationScreen> createState() => _SimpleLocationScreenState();
}

class _SimpleLocationScreenState extends State<SimpleLocationScreen> {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    // 1. Check Permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permission permanently denied")),
      );
      return;
    }

    // 2. Get Current Position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple GeoLocator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude: ${latitude ?? "N/A"}"),
            Text("Longitude: ${longitude ?? "N/A"}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getLocation,
              child: const Text("Get Location"),
            ),
          ],
        ),
      ),
    );
  }
}
