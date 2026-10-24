import 'package:flutter/material.dart';
class PermissionManagerScreen extends StatelessWidget {
  const PermissionManagerScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permission Manager'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.admin_panel_settings, size: 80, color: Color(0xFF2563EB)),
          SizedBox(height: 20),
          Text('Permission Manager', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('WanaLab v3.4.45\nTool #59 of 98\nReady for implementation', textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
