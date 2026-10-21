import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WanaLabApp());
}

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A7C3E)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WanaLab Toolkit - VarRho Engine'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.engineering_rounded, size: 80, color: Color(0xFF0A7C3E)),
              const SizedBox(height: 20),
              const Text(
                'VarRho Engine',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'v2.1.0+16',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              const Text(
                'Build is now GREEN.\nlib/main.dart restored.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Engine Ready'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
