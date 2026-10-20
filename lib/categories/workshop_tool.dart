import 'package:flutter/material.dart';
class WorkshopToolScreen extends StatelessWidget {
  final String mode;
  WorkshopToolScreen({this.mode = "Workshop"});
  @override Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.build, size: 60, color: Colors.orange),
      SizedBox(height:10),
      Text("$mode Mode", style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
      Padding(padding: EdgeInsets.all(16), child: Text("Var-Rho Engine scanning magnetic field. Green=Clean, Orange=Moderate, Red=High. Use for $mode.", textAlign: TextAlign.center, style: TextStyle(fontSize: 12))),
    ]));
  }
}
