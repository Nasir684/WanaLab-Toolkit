import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class BabyScreen extends StatefulWidget {
  const BabyScreen({super.key});

  @override
  State<BabyScreen> createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen> {
  static const String _prefsKey = 'baby_logs';
  List<String> logs = <String>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    logs = await StorageService.getStringList(_prefsKey);
    if (mounted) setState(() {});
  }

  Future<void> _save() async {
    await StorageService.setStringList(_prefsKey, logs);
  }

  Future<void> addLog(String item) async {
    setState(() => logs.insert(0, '$item - ${DateTime.now().toString().split(' ')[0]}'));
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BABY WELLNESS'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip('Feeding', () => addLog('Feeding Log')),
              _chip('Sleep', () => addLog('Sleep Log')),
              _chip('Diaper', () => addLog('Diaper Log')),
              _chip('Mood', () => addLog('Mood Log')),
              _chip('Vaccination', () => addLog('Vaccination Log')),
              _chip('Milestones', () => addLog('Milestone Log')),
            ],
          ),
          const Divider(),
          if (logs.isEmpty)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('No baby wellness entries yet.', style: TextStyle(color: Color(0xFF0F766E), fontSize: 11)),
            )
          else
            ...logs.map(
              (item) => Card(
                child: ListTile(
                  title: Text(item, style: const TextStyle(fontSize: 10)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    onPressed: () async {
                      setState(() => logs.remove(item));
                      await _save();
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _chip(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}
