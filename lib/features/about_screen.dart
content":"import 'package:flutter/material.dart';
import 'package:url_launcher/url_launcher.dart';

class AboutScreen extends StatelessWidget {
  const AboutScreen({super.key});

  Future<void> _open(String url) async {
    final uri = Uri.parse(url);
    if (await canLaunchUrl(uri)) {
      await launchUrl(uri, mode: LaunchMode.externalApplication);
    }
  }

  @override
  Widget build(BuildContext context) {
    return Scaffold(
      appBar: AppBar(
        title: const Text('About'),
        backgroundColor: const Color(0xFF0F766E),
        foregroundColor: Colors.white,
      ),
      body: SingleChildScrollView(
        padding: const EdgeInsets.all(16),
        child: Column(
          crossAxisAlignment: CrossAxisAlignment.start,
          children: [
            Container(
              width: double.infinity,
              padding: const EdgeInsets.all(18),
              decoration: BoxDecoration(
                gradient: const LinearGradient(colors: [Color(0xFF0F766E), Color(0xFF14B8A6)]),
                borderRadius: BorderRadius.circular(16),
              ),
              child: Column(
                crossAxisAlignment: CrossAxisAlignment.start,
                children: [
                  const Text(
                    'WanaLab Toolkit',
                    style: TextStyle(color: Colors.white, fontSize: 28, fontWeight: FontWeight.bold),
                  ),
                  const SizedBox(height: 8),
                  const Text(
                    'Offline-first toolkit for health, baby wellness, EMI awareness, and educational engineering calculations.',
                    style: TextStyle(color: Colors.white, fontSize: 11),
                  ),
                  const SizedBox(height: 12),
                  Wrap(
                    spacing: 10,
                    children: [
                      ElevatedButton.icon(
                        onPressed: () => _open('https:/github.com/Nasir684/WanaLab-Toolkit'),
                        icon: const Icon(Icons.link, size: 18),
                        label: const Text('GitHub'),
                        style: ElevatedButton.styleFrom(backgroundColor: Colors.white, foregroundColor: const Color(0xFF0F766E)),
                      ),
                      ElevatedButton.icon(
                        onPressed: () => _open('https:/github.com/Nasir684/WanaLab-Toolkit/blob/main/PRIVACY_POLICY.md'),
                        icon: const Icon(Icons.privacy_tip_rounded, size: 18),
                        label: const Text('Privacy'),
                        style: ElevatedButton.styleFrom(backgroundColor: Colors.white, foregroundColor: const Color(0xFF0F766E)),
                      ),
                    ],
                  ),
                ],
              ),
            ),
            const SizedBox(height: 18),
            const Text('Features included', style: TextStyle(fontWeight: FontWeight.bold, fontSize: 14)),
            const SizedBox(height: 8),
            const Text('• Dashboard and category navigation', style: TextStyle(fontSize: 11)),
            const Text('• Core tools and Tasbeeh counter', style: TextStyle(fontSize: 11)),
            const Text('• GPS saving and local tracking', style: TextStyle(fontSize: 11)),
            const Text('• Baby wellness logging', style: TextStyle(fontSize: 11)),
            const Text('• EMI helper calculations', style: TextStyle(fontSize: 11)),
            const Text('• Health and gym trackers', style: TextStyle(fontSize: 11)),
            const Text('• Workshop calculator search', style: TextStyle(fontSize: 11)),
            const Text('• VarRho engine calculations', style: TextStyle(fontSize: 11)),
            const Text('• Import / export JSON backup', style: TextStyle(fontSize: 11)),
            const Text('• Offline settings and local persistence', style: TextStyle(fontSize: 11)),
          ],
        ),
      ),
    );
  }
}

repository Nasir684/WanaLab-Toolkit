import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/storage_service.dart';

class ImportExportScreen extends StatefulWidget {
  const ImportExportScreen({super.key});

  @override
  State<ImportExportScreen> createState() => _ImportExportScreenState();
}

class _ImportExportScreenState extends State<ImportExportScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final jsonMap = {
      'gps': await StorageService.getStringList('gps_saved_locations'),
      'baby': await StorageService.getStringList('baby_logs'),
      'gym': await StorageService.getStringList('gym_stats'),
      'core': {'tasbeeh': await StorageService.getInt('core_tasbeeh_count')},
    };

    if (mounted) {
      setState(() {
        controller.text = const JsonEncoder.withIndent('  ').convert(jsonMap);
      });
    }
  }

  Future<void> _export() async {
    await Clipboard.setData(ClipboardData(text: controller.text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data copied to clipboard.')),
    );
  }

  Future<void> _import() async {
    try {
      final parsed = jsonDecode(controller.text);
      if (parsed is! Map) throw const FormatException('Expected JSON object.');

      final gpsValue = parsed['gps'];
      final babyValue = parsed['baby'];
      final gymValue = parsed['gym'];
      final coreValue = parsed['core'];

      if (gpsValue is List) {
        await StorageService.setStringList('gps_saved_locations', List<String>.from(gpsValue));
      }
      if (babyValue is List) {
        await StorageService.setStringList('baby_logs', List<String>.from(babyValue));
      }
      if (gymValue is List) {
        await StorageService.setStringList('gym_stats', List<String>.from(gymValue));
      }
      if (coreValue is Map && coreValue['tasbeeh'] != null) {
        await StorageService.setInt('core_tasbeeh_count', int.parse(coreValue['tasbeeh'].toString()));
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data imported successfully.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid JSON format.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMPORT / EXPORT'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'JSON data',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _export,
                    icon: const Icon(Icons.copy),
                    label: const Text('Copy / Export'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _import,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Import'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
