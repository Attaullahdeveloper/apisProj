import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Googlemapclass extends StatefulWidget {
  const Googlemapclass({super.key});

  @override
  State<Googlemapclass> createState() => _GooglemapclassState();
}

class _GooglemapclassState extends State<Googlemapclass> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  // Initial position (Islamabad example)
  final LatLng _initialPosition = const LatLng(33.6844, 73.0479);

  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _getUserCurrentLocation();
    _startTracking();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _startTracking() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    );

    _positionStreamSubscription = Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      double currentLat = position.latitude;
      double currentLng = position.longitude;

      // Update Firestore
      FirebaseFirestore.instance.collection('tracking').doc('current_user').set({
        'lat': currentLat,
        'lng': currentLng,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Update UI
      setState(() {
        LatLng userPosition = LatLng(currentLat, currentLng);
        LatLng randomPosition = const LatLng(33.7000, 73.0600);

        // Update Marker
        _markers.removeWhere((m) => m.markerId.value == "currentLocation");
        _markers.add(
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: userPosition,
            infoWindow: InfoWindow(
              title: "My Current Location",
              snippet: "Lat: $currentLat, Lng: $currentLng",
            ),
          ),
        );

        // Update Polyline
        _polylines.clear();
        _polylines.add(
          Polyline(
            polylineId: const PolylineId("route"),
            points: [userPosition, randomPosition],
            color: Colors.blue,
            width: 5,
          ),
        );

        // Optional: Animate camera to new location
        if (mapController != null) { // Check if controller is initialized
          mapController.animateCamera(
            CameraUpdate.newLatLng(userPosition),
          );
        }

      });
    });
  }

// current location user funciton-----------------------
  Future<void> _getUserCurrentLocation() async {
    // 1. Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable them.'),
      ));
      return;
    }

    // 2. Check permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are denied'),
        ));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.'),
      ));
      return;
    }

    // 3. Get the Position
    Position position = await Geolocator.getCurrentPosition();

    double currentLat = position.latitude;
    double currentLng = position.longitude;

    // 4. Update the Marker and Camera
    setState(() {
      LatLng userPosition = LatLng(currentLat, currentLng);
      LatLng randomPosition = const LatLng(33.7000, 73.0600); // Random nearby location

      _markers.clear();
      _polylines.clear();

      // Add User Location Marker
      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: userPosition,
          infoWindow: InfoWindow(
            title: "My Current Location",
            snippet: "Lat: $currentLat, Lng: $currentLng",
          ),
        ),
      );

      // Add Random Marker
      _markers.add(
        Marker(
          markerId: const MarkerId("randomMarker"),
          position: randomPosition,
          infoWindow: const InfoWindow(
            title: "Random Place",
            snippet: "This is a random marker",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Different color
        ),
      );

      // Add Polyline
      _polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          points: [userPosition, randomPosition],
          color: Colors.blue,
          width: 5,
        ),
      );
    });

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLat, currentLng),
          zoom: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14,
        ),
        mapType: MapType.hybrid,
        onMapCreated: _onMapCreated,
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getUserCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
