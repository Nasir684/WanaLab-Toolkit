import 'package:flutter/material.dart';
class JsonFormatterScreen extends StatelessWidget {
  const JsonFormatterScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Formatter'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.data_object, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('JSON Formatter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #89 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
