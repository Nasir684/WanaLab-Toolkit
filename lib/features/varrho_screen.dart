import 'package:flutter/material.dart';

class VarrhoScreen extends StatefulWidget {
  const VarrhoScreen({super.key});

  @override
  State<VarrhoScreen> createState() => _VarrhoScreenState();
}

class _VarrhoScreenState extends State<VarrhoScreen> {
  String query = '';

  final List<Map<String, String>> topics = [
    {'title': 'Varroa Destructor Biology', 'desc': 'Mite lifecycle research'},
    {'title': 'Colony Collapse Study', 'desc': 'EMI + Varroa combined effects'},
    {'title': 'Thermal Treatment', 'desc': 'Heat treatment research data'},
    {'title': 'Organic Acid Treatment', 'desc': 'Formic / Oxalic acid notes'},
    {'title': 'Wana Local Survey', 'desc': 'Local beekeepers data - Offline'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = topics.where((t) => t['title']!.toLowerCase().contains(query.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF061B2A),
      appBar: AppBar(
        title: const Text('VARROA RESEARCH'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Search research',
                labelStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white70),
              ),
              onChanged: (v) => setState(() => query = v),
            ),
          ),
          const SizedBox(height: 12),
          ...filtered.map((item) => Card(
            color: Colors.white.withOpacity(0.08),
            child: ListTile(
              title: Text(item['title']!, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              subtitle: Text(item['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 11)),
              leading: const Icon(Icons.bug_report, color: Color(0xFF0F766E)),
            ),
          )),
        ],
      ),
    );
  }
}
