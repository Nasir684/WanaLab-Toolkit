import 'package:flutter/material.dart';
class RandomNumberScreen extends StatelessWidget {
  const RandomNumberScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Number'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.casino, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Random Number', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #77 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
