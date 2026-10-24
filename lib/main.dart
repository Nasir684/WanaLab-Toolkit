import 'package:flutter/material.dart';
void main(){ runApp(const MyApp()); }
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('WanaLab TEST'), backgroundColor: Colors.blue, foregroundColor: Colors.white),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.check_circle, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text('WanaLab Fixed!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text('If you see this, crash is fixed', style: TextStyle(fontSize: 16)),
        ])),
      ),
    );
  }
}
