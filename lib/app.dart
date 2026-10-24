import 'package:flutter/material.dart';
import 'features/dashboard_screen.dart';
class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WanaLab',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: DashboardScreen(),
    );
  }
}
