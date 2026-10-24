import 'package:flutter/material.dart';
class HealthTrackerScreen extends StatelessWidget {
  const HealthTrackerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Health Tracker'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.favorite, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Health Tracker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #91 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
