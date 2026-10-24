import 'package:flutter/material.dart';
import 'features/dashboard_screen.dart';
class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});
  @override Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit v3.4.45',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Color(0xFF2563EB)),
      home: DashboardScreen(),
    );
  }
}
