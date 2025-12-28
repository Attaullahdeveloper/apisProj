import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Googlemapclass extends StatefulWidget {
  const Googlemapclass({super.key});

  @override
  State<Googlemapclass> createState() => _GooglemapclassState();
}

class _GooglemapclassState extends State<Googlemapclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Started',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(73.0000, 83.2222))),
    );
  }
}
