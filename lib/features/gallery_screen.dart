import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const String _offlineKey = 'offline_mode';
  static const String _religionKey = 'religion_preference';

  bool offline = true;
  String religion = 'All';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    offline = await StorageService.getBool(_offlineKey, defaultValue: true);
    religion = await StorageService.getString(_religionKey, defaultValue: 'All');
    if (mounted) setState(() {});
  }

  Future<void> _save() async {
    await StorageService.setBool(_offlineKey, offline);
    await StorageService.setString(_religionKey, religion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Offline mode'),
            value: offline,
            onChanged: (value) async {
              setState(() => offline = value);
              await _save();
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: religion,
            decoration: const InputDecoration(
              labelText: 'Religion preference',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'All', child: Text('All Religions Equal')),
              DropdownMenuItem(value: 'Islam', child: Text('Islam')),
              DropdownMenuItem(value: 'Christianity', child: Text('Christianity')),
              DropdownMenuItem(value: 'Hinduism', child: Text('Hinduism')),
            ],
            onChanged: (value) async {
              setState(() => religion = value ?? 'All');
              await _save();
            },
          ),
        ],
      ),
    );
  }
}
