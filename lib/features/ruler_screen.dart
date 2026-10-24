import 'package:flutter/material.dart';
class RulerScreen extends StatelessWidget {
  const RulerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ruler'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.straighten, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Ruler', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #69 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
