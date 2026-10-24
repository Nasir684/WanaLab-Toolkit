import 'package:flutter/material.dart';
class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Manager'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.folder, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('File Manager', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #34 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
