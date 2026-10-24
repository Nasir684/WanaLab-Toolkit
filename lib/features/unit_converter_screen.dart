
import 'package:flutter/material.dart';
class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unit Converter'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.widgets, size: 80, color: Color(0xFF2563EB)),
        SizedBox(height: 20),
        Text('Unit Converter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Ready - logic will be added later', style: TextStyle(color: Colors.grey)),
      ])),
    );
  }
}
