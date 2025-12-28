import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isLoading = false;

  double? latitude;
  double? longitude;
  double? accuracy;

  String fullAddress = "N/A";

  // ===============================
  // MAIN FUNCTION
  // ===============================
  Future<void> getCurrentLocation() async {
    setState(() => isLoading = true);

    try {
      // 1 Check location service
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnackBar("Location service is disabled", Colors.red);
        return;
      }

      // 2 Check permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        _showSnackBar(
          "Location permission permanently denied",
          Colors.red,
        );
        return;
      }

      // 3 Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
      accuracy = position.accuracy;

      // 4⃣ Reverse geocoding
      //  Fixed issue by using correct geocoding package
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        fullAddress = [
          place.street,
          place.subLocality,
          place.locality,
          place.administrativeArea,
          place.postalCode,
          place.country,
        ].where((e) => e != null && e!.isNotEmpty).join(", ");
      }

      _showSnackBar("Location fetched successfully", Colors.green);
    } catch (e) {
      _showSnackBar("Error: $e", Colors.red);
    } finally {
      setState(() => isLoading = false);
    }
  }

  // ===============================
  // UI
  // ===============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocator Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoRow("Latitude", latitude?.toStringAsFixed(6) ?? "N/A"),
            _infoRow("Longitude", longitude?.toStringAsFixed(6) ?? "N/A"),
            _infoRow(
              "Accuracy",
              accuracy != null ? "±${accuracy!.toStringAsFixed(1)} m" : "N/A",
            ),
            const Divider(height: 30),
            _infoRow("Address", fullAddress, isBold: true),
            const SizedBox(height: 30),

            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
              onPressed: getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================
  // HELPERS
  // ===============================
  Widget _infoRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
