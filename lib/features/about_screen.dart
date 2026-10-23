import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061B2A),
      appBar: AppBar(
        title: const Text('About WanaLab'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WanaLab Toolkit', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'Research-oriented mobile platform for engineering estimation, EMI screening, detector analysis, and scientific workflow support, designed for continued evolution through 2037.',
                  style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
                ),
                SizedBox(height: 12),
                Text(
                  'Built to support early-stage estimation, scenario planning, structured scientific reporting, and future-facing engineering research while maintaining clear distinction between research-based approximation and certified measurement.',
                  style: TextStyle(color: Colors.white70, fontSize: 11, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _section('Designed For Scholars & Researchers', [
            '• Estimate exposure and shielding conditions',
            '• Document assumptions and scientific notes',
            '• Compare multiple scenarios',
            '• Export results in shareable formats',
            '• Preserve local research records offline',
            '• Collaborate via direct sharing without cloud',
          ]),
          _section('Privacy-First Principles', [
            '• No login required',
            '• No subscription - one-time install',
            '• No cloud storage of user data',
            '• No tracking or analytics',
            '• No personal data collection',
            '• Local-only calculation',
            '• Export via device native share only',
          ]),
          _section('Intended Use', [
            '• Engineering & workshop calculations',
            '• EMI & environmental screening',
            '• Detector & sensor risk estimation',
            '• Academic & exploratory workflows',
            '• Structured technical reporting',
          ]),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0F766E).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF0F766E).withOpacity(0.3)),
            ),
            child: const Text(
              'Transparency, assumptions & reproducibility are core. Outputs are for research & design review, not replacement for calibrated instruments or safety-critical validation.',
              style: TextStyle(color: Color(0xFF5EE9D5), fontSize: 11, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _section(String title, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...items.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(e, style: const TextStyle(color: Colors.white70, fontSize: 11)),
          )),
        ],
      ),
    );
  }
}
