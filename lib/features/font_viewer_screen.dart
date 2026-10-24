
import 'package:flutter/material.dart';
class FontViewerScreen extends StatelessWidget {
  const FontViewerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Font Viewer'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.widgets, size: 80, color: Color(0xFF2563EB)),
        SizedBox(height: 20),
        Text('Font Viewer', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Ready - logic will be added later', style: TextStyle(color: Colors.grey)),
      ])),
    );
  }
}
