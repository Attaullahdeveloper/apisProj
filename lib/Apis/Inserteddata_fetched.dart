import 'package:flutter/material.dart';

class InserteddataFetched extends StatelessWidget {
  final String name;
  final String year;
  final String price;
  final String cpuModel;
  final String hardDisk;

  const InserteddataFetched({
    super.key,
    required this.name,
    required this.year,
    required this.price,
    required this.cpuModel,
    required this.hardDisk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserted Data Fetching...'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min, //  prevents shrinking
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name', style: const TextStyle(fontSize: 18)),
                  Text('Year: $year', style: const TextStyle(fontSize: 18)),
                  Text('Price: $price', style: const TextStyle(fontSize: 18)),
                  Text('CPU Model: $cpuModel', style: const TextStyle(fontSize: 18)),
                  Text('Hard Disk: $hardDisk', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
