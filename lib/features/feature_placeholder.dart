import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF0F766E), Color(0xFF14B8A6)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WanaLab Toolkit',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Offline-first toolkit for health, baby wellness, EMI awareness, and educational engineering calculations.',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _open('https://github.com/Nasir684/WanaLab-Toolkit'),
                        icon: const Icon(Icons.link, size: 18),
                        label: const Text('GitHub'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF0F766E)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _open('https://github.com/Nasir684/WanaLab-Toolkit/blob/main/PRIVACY_POLICY.md'),
                        icon: const Icon(Icons.privacy_tip_rounded, size: 18),
                        label: const Text('Privacy'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF0F766E)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text('Features included', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            const Text('• Dashboard and category navigation', style: TextStyle(fontSize: 11)),
            const Text('• Core tools and Tasbeeh counter', style: TextStyle(fontSize: 11)),
            const Text('• GPS saving and local tracking', style: TextStyle(fontSize: 11)),
            const Text('• Baby wellness logging', style: TextStyle(fontSize: 11)),
            const Text('• EMI helper calculations', style: TextStyle(fontSize: 11)),
            const Text('• Health and gym trackers', style: TextStyle(fontSize: 11)),
            const Text('• Workshop calculator search', style: TextStyle(fontSize: 11)),
            const Text('• VarRho engine calculations', style: TextStyle(fontSize: 11)),
            const Text('• Import / export JSON backup', style: TextStyle(fontSize: 11)),
            const Text('• Offline settings and local persistence', style: TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
