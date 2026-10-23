import 'package:flutter/material.dart';

class VarRhoScreen extends StatefulWidget {
  const VarRhoScreen({super.key});

  @override
  State<VarRhoScreen> createState() => _VarRhoScreenState();
}

class _VarRhoScreenState extends State<VarRhoScreen> {
  String query = '';

  final List<Map<String, String>> topics = [
    {'title': 'VarRho Estimation Engine', 'desc': 'ρ = R×A/L - Resistivity research core'},
    {'title': 'EMI Screening Research', 'desc': 'Exposure & shielding estimation'},
    {'title': 'Detector Risk Analysis', 'desc': 'Detector & sensor risk workflows'},
    {'title': 'Workshop Estimation', 'desc': 'Engineering calculations support'},
    {'title': 'Scenario Planning', 'desc': 'Compare multiple research scenarios'},
    {'title': 'Assumptions Documentation', 'desc': 'Scientific notes & reproducibility'},
    {'title': 'Structured Reporting', 'desc': 'Technical export & sharing'},
    {'title': 'Wenner Soil Resistivity', 'desc': 'ρ = 2πaR - ASTM field method'},
    {'title': 'Local-Only Research', 'desc': 'Offline records - No cloud dependency'},
    {'title': 'Future Evolution 2037', 'desc': 'Long-term research platform roadmap'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = topics.where((t) => t['title']!.toLowerCase().contains(query.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF061B2A),
      appBar: AppBar(
        title: const Text('VARRHO RESEARCH'),
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
              leading: const Icon(Icons.science_rounded, color: Color(0xFF0F766E)),
            ),
          )),
        ],
      ),
    );
  }
}
