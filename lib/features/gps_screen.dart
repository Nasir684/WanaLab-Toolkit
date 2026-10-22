import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({super.key});

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  static const String _prefsKey = 'core_tasbeeh_count';

  int tasbeeh = 0;
  final teachings = [
    'Peace for all — love, mercy, and compassion for everyone.',
    'Islam — peace be upon you and all of humanity.',
    'Christianity — love thy neighbor and act with kindness.',
    'Hinduism — Vasudhaiva Kutumbakam, the world is one family.',
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final value = await StorageService.getInt(_prefsKey);
    if (mounted) {
      setState(() => tasbeeh = value);
    }
  }

  Future<void> _save() async {
    await StorageService.setInt(_prefsKey, tasbeeh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORE - Free Forever'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Qibla Compass - Offline',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.explore_rounded, size: 64, color: Color(0xFF0F766E)),
                  const SizedBox(height: 8),
                  const Text(
                    'Wana Qibla ~ 290°\nPrayer Time Estimates\nFajr 04:30 • Zuhr 12:15 • Asr 15:45 • Maghrib 18:30 • Isha 19:45',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Tasbeeh Count: $tasbeeh',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          setState(() => tasbeeh++);
                          await _save();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Count'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F766E),
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => tasbeeh = 0);
                          await _save();
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Peace Teaching',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ...teachings.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('• $item', style: const TextStyle(fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
