import 'package:flutter/material.dart';
class NotificationHistoryScreen extends StatelessWidget {
  const NotificationHistoryScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification History'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.notifications, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Notification History', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #60 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
