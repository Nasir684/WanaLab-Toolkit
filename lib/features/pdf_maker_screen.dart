import 'package:flutter/material.dart';
class PdfMakerScreen extends StatelessWidget {
  const PdfMakerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Maker'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.picture_as_pdf, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('PDF Maker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #31 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
