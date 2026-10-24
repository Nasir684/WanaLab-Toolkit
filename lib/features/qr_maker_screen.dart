import 'package:flutter/material.dart';
class QrMakerScreen extends StatelessWidget {
  const QrMakerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Maker'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.qr_code_2, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('QR Maker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #13 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
