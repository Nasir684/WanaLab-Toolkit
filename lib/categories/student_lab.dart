import 'package:flutter/material.dart';
class StudentLabScreen extends StatelessWidget {
  final List<Map<String,dynamic>> liveLog;
  StudentLabScreen({required this.liveLog});
  @override Widget build(BuildContext context) {
    return Column(children: [
      Container(padding: EdgeInsets.all(12), color: Colors.blueGrey, width: double.infinity, child: Text("Student Lab / Baby Pollution Log - Var-Rho", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      Expanded(child: ListView.builder(itemCount: liveLog.length, itemBuilder: (_,i){
        var r = liveLog[i];
        return ListTile(dense:true, leading: Text(r['time'], style: TextStyle(fontSize: 11)), title: Text("${r['mode']} - ${r['type']}", style: TextStyle(fontSize: 12)), subtitle: Text("Var: ${r['Var'].toStringAsFixed(1)} Rho: ${r['Rho'].toStringAsFixed(2)}", style: TextStyle(fontSize: 11)));
      }))
    ]);
  }
}
