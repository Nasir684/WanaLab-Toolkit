import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final tools = List.generate(98, (i) => 'Tool ${i+1}');
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WanaLab v3.4.45 - 98 Tools'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: 98,
        itemBuilder: (ctx,i) => Card(child: Center(child: Text(tools[i]))),
      ),
    );
  }
}
