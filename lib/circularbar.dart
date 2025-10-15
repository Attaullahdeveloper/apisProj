import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class Circularbar extends StatefulWidget {
  const Circularbar({super.key});

  @override
  State<Circularbar> createState() => _CircularbarState();
}

class _CircularbarState extends State<Circularbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 15.0,
      percent: 0.871, // 87.1%
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Personal progress", style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("87.1%", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
      linearGradient: LinearGradient(
        colors: [Color(0xFF6A5AE0), Color(0xFF3DE8D6)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      backgroundColor: Colors.grey.shade800,
      circularStrokeCap: CircularStrokeCap.round,

    )
    ,
    );
  }
}
