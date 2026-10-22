import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Calculator', Icons.calculate_rounded),
      ('VarRho', Icons.electric_bolt_rounded),
      ('Health', Icons.favorite_rounded),
      ('Science', Icons.science_rounded),
      ('Map', Icons.map_rounded),
      ('Baby', Icons.child_care_rounded),
      ('Private', Icons.lock_rounded),
      ('Settings', Icons.settings_rounded),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final title = items[index].$1;
          final icon = items[index].$2;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF14B8A6), Color(0xFF0F766E)],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 42, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
