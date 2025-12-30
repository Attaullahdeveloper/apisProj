import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Googlemapclass extends StatefulWidget {
  const Googlemapclass({super.key});

  @override
  State<Googlemapclass> createState() => _GooglemapclassState();
}

class _GooglemapclassState extends State<Googlemapclass> {
  late GoogleMapController mapController;
  // Marker list
  final Set<Marker> _markers = {};

  // Initial position
  final LatLng _initialPosition = const LatLng(33.6844, 73.0479); // Islamabad example

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("marker1"),
          position: _initialPosition,
          infoWindow: const InfoWindow(
            title: "My Location",
            snippet: "This is marker location",
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Started',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(73.0000, 83.2222),
          zoom: 14,),
      mapType: MapType.hybrid,
      markers: _markers,),
    );
  }
}
