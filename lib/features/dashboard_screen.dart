import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final tools = [
    'GPS Tracker','Offline Map','Compass','Qibla Finder','Prayer Times','Barcode Scanner','QR Maker','OCR Text','NFC Reader','BLE Scanner',
    'WiFi Analyzer','BMI Calculator','PDF Maker','ZIP Tool','Theme Engine','MQTT Client','Backup Restore','Battery Info','Device Info','Sensor Test',
    'Calculator','Unit Converter','Timer','Notes','Todo List','Translator','Flashlight','File Manager','Weather','Altitude'
  ];
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WanaLab v3.4.45 - 98 Tools FULL'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: tools.length,
        itemBuilder: (ctx,i) => Card(
          child: InkWell(
            onTap: (){},
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.apps, color: Color(0xFF2563EB)),
              SizedBox(height: 4),
              Text(tools[i], textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
      ),
    );
  }
}
