import 'package:flutter/material.dart';
class VoiceRecorderScreen extends StatelessWidget {
  const VoiceRecorderScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Voice Recorder'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.mic, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Voice Recorder', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #37 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
