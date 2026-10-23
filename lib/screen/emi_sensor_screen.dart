import 'package:flutter/material.dart';
import '../services/export_service.dart';

class EMISensorScreen extends StatefulWidget {
  const EMISensorScreen({super.key});

  @override
  State<EMISensorScreen> createState() => _EMISensorScreenState();
}

class _EMISensorScreenState extends State<EMISensorScreen> {
  final readingController = TextEditingController(text: '0.8');
  String result = '';
  List<Map<String, dynamic>> exportRows = const [];

  void calculate() {
    final reading = double.tryParse(readingController.text) ?? 0.0;
    if (reading <= 0) {
      setState(() {
        result = 'Reading must be > 0';
        exportRows = const [];
      });
      return;
    }

    String status;
    Color statusColor;
    if (reading < 0.5) {
      status = 'LOW - Safe zone';
      statusColor = Colors.green;
    } else if (reading < 2.0) {
      status = 'MODERATE - Awareness';
      statusColor = Colors.orange;
    } else {
      status = 'HIGH - Reduce exposure';
      statusColor = Colors.red;
    }

    setState(() {
      exportRows = [
        {'Sensor Type': 'EMI Sensor', 'Reading V/m': reading, 'Status': status}
      ];
      result = 'Reading: $reading V/m\nStatus: $status';
    });
  }

  @override
  void dispose() {
    readingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061B2A),
      appBar: AppBar(
        title: const Text('EMI SENSOR'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: TextField(
              controller: readingController,
              style: const TextStyle(color: Colors.white),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Sensor Reading V/m',
                labelStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.sensors),
            label: const Text('Analyze'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F766E),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (result.isNotEmpty)
            Card(
              color: const Color(0xFFCCFBF1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(result, style: const TextStyle(fontSize: 12, color: Colors.black87)),
              ),
            ),
          if (exportRows.isNotEmpty) ...[
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => ExportService.exportRows(context, exportRows, title: 'EMI Sensor'),
              icon: const Icon(Icons.download_rounded),
              label: const Text('Export CSV / TXT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.12),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
