import 'dart:math';

import 'package:flutter/material.dart';

class VarRhoScreen extends StatefulWidget {
  const VarRhoScreen({super.key});

  @override
  State<VarRhoScreen> createState() => _VarRhoScreenState();
}

class _VarRhoScreenState extends State<VarRhoScreen> {
  String method = 'var';

  final kw = TextEditingController(text: '10');
  final pf = TextEditingController(text: '0.8');
  final resistivity = TextEditingController(text: '50');
  final area = TextEditingController(text: '2');
  final length = TextEditingController(text: '10');
  String result = '';

  void calculate() {
    if (method == 'var') {
      final power = double.tryParse(kw.text) ?? 0;
      final pF = double.tryParse(pf.text) ?? 0;
      if (pF <= 0) {
        setState(() => result = 'Power factor must be > 0.');
        return;
      }

      final kva = power / pF;
      final angleDegrees = acos(pF) * 180 / pi;
      final kvar = power * tan(acos(pF));
      setState(() {
        result = 'P = $power kW\nQ = ${kvar.toStringAsFixed(2)} kVAR\nS = ${kva.toStringAsFixed(2)} kVA\nθ = ${angleDegrees.toStringAsFixed(1)}°';
      });
    } else {
      final rho = double.tryParse(resistivity.text) ?? 0;
      final a = double.tryParse(area.text) ?? 0;
      final l = double.tryParse(length.text) ?? 0;
      if (rho <= 0 || a <= 0 || l <= 0) {
        setState(() => result = 'All values must be greater than 0.');
        return;
      }

      final resistance = (rho * a) / l;
      setState(() => result = 'R = ${resistance.toStringAsFixed(4)} Ω\nρ = $rho Ω·m\nA = $a m²\nL = $l m');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VAR / RHO Engine'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'var', label: Text('VAR IEEE')),
              ButtonSegment(value: 'rho', label: Text('Rho ASTM')),
            ],
            selected: {method},
            onSelectionChanged: (selection) => setState(() => method = selection.first),
          ),
          const SizedBox(height: 12),
          if (method == 'var') ...[
            TextField(
              controller: kw,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Real Power kW', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: pf,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Power Factor', border: OutlineInputBorder()),
            ),
          ] else ...[
            TextField(
              controller: resistivity,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Resistivity ρ (Ω·m)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: area,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Area A (m²)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: length,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Length L (m)', border: OutlineInputBorder()),
            ),
          ],
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.calculate_rounded),
            label: const Text('Calculate'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F766E),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (result.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFCCFBF1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF0F766E)),
              ),
              child: Text(result, style: const TextStyle(fontSize: 11)),
            ),
        ],
      ),
    );
  }
}
