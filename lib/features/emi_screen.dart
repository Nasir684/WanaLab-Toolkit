import 'package:flutter/material.dart';

import '../services/export_service.dart';

class EMIScreen extends StatefulWidget {
  const EMIScreen({super.key});

  @override
  State<EMIScreen> createState() => _EMIScreenState();
}

class _EMIScreenState extends State<EMIScreen> {
  final controller = TextEditingController(text: '2.5');
  String result = '';
  List<Map<String, dynamic>> exportRows = const [];

  void calculate() {
    final value = double.tryParse(controller.text) ?? 0.0;

    if (value <= 0) {
      setState(() {
        result = 'E-field must be greater than 0 V/m.';
        exportRows = const [];
      });
      return;
    }

    final magneticField = value / 377.0;

    final rows = <Map<String, dynamic>>[
      {
        'Name': 'EMI Awareness',
        'E-field (V/m)': value,
        'H-field (A/m)': magneticField,
      }
    ];

    setState(() {
      exportRows = rows;
      result = 'E = $value V/m\nH = ${magneticField.toStringAsFixed(6)} A/m\nEMI awareness only';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI WELLNESS'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'E-field V/m',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.calculate),
            label: const Text('Calculate'),
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
                child: Text(result, style: const TextStyle(fontSize: 11)),
              ),
            ),
          if (exportRows.isNotEmpty) ...[
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => ExportService.exportRows(
                context,
                exportRows,
                title: 'EMI results',
              ),
              icon: const Icon(Icons.download_rounded),
              label: const Text('Export CSV / TXT'),
            ),
          ],
        ],
      ),
    );
  }
}
