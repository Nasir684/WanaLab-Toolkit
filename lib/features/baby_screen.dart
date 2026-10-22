import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class GPSScreen extends StatefulWidget {
  const GPSScreen({super.key});

  @override
  State<GPSScreen> createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  static const String _prefsKey = 'gps_saved_locations';

  final lat = TextEditingController(text: '32.3028');
  final lng = TextEditingController(text: '69.7175');
  final title = TextEditingController();
  List<String> saves = <String>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    saves = await StorageService.getStringList(_prefsKey);
    if (mounted) setState(() {});
  }

  Future<void> _save() async {
    await StorageService.setStringList(_prefsKey, saves);
  }

  Future<void> saveLocation() async {
    final trimmedTitle = title.text.trim();
    if (trimmedTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title or note first.')),
      );
      return;
    }

    final entry = '$trimmedTitle | ${lat.text},${lng.text} | ${DateTime.now().toString().split(' ')[0]}';
    setState(() {
      saves.insert(0, entry);
      title.clear();
    });
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS & Maps'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('GPS Save - Private Offline', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 12),
          TextField(
            controller: title,
            decoration: const InputDecoration(
              labelText: 'Title / Notes',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: lat,
                  decoration: const InputDecoration(labelText: 'Latitude', border: OutlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: lng,
                  decoration: const InputDecoration(labelText: 'Longitude', border: OutlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: saveLocation,
            icon: const Icon(Icons.save),
            label: const Text('Save Private Offline'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F766E),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (saves.isEmpty)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('No saved locations yet.', style: TextStyle(color: Color(0xFF0F766E), fontSize: 11)),
            )
          else
            ...saves.map(
              (item) => Card(
                child: ListTile(
                  leading: const Icon(Icons.place, color: Color(0xFF0F766E)),
                  title: Text(item, style: const TextStyle(fontSize: 10)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    onPressed: () async {
                      setState(() => saves.remove(item));
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
}
