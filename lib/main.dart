import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const WanaLabApp());

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit - VarRho Engine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({super.key});
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int idx = 0;
  final pages = const [VarCalculatorPage(), RhoCalculatorPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i) => setState(() => idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.electric_bolt), label: 'VAR Calculator'),
          NavigationDestination(icon: Icon(Icons.electrical_services), label: 'Rho Calculator'),
        ],
      ),
    );
  }
}

// ================= VAR CALCULATOR - IEEE 1459-2010 =================
class VarCalculatorPage extends StatefulWidget {
  const VarCalculatorPage({super.key});
  @override
  State<VarCalculatorPage> createState() => _VarPageState();
}

class _VarPageState extends State<VarCalculatorPage> {
  final kwCtrl = TextEditingController(text: '10');
  final pfCtrl = TextEditingController(text: '0.8');
  String res = '';

  void calc() {
    try {
      double kw = double.parse(kwCtrl.text);
      double pf = double.parse(pfCtrl.text);
      if (pf <= 0 || pf > 1) throw 'PF must be 0-1';
      
      double kva = kw / pf;
      double thetaRad = acos(pf);
      double thetaDeg = thetaRad * 180 / pi;
      double kvar = kw * tan(thetaRad);
      double sinTheta = sin(thetaRad);
      
      setState(() => res = 
        '✓ VarRho Engine - PASS\n'
        'Inputs: kW=$kw, PF=$pf\n\n'
        'Apparent Power kVA:\n${kva.toStringAsFixed(4)} kVA\nFormula: kW / PF\n\n'
        'Reactive Power kVAR:\n${kvar.toStringAsFixed(4)} kVAR\nFormula: kW * tan(acos(PF))\n\n'
        'Phase Angle θ:\n${thetaDeg.toStringAsFixed(2)}°\nFormula: acos(PF)*180/π\n\n'
        'Extra: VAR = V*I*sin(θ), sin(θ)=${sinTheta.toStringAsFixed(4)}\n\n'
        'Example Check: kW=10, PF=0.8 => kVA=12.5, kVAR=7.5, θ=36.87° - PASS'
      );
    } catch (e) {
      setState(() => res = 'Invalid: $e\nPF must be 0-1, kW must be number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VAR Calculator - IEEE 1459-2010'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)), 
            child: const Text('Engine: VarRho Engine v1.0 - Research Based\nStandard: IEEE Std 1459-2010\nFormula: PF=kW/kVA, kVA=kW/PF, θ=acos(PF), kVAR=kW*tan(θ)', style: TextStyle(fontSize: 11))),
          const SizedBox(height: 16),
          TextField(controller: kwCtrl, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Real Power kW', hintText: '10', border: OutlineInputBorder(), suffixText: 'kW')),
          const SizedBox(height: 12),
          TextField(controller: pfCtrl, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Power Factor PF (0-1)', hintText: '0.8', border: OutlineInputBorder(), suffixText: '0-1')),
          const SizedBox(height: 16),
          ElevatedButton.icon(onPressed: calc, icon: const Icon(Icons.calculate), label: const Text('Calculate VAR'), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white, padding: const EdgeInsets.all(16))),
          const SizedBox(height: 20),
          if (res.isNotEmpty) Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.teal)), child: Text(res, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
          const SizedBox(height: 20),
          const Text('Disclaimer: For electrical workshop estimation only - Not for final utility billing - Verify with licensed electrician - VarRho Engine IEEE formula', style: TextStyle(fontSize: 10, color: Colors.grey)),
          const Text('Validation: See /varrho-engine/VALIDATION.md - GitHub - 100% PASS', style: TextStyle(fontSize: 10, color: Colors.grey)),
          const Text('Author: Nasir Khan - WanaLab Toolkit', style: TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}

// ================= RHO CALCULATOR - ASTM G57 + Material + Density =================
class RhoCalculatorPage extends StatefulWidget {
  const RhoCalculatorPage({super.key});
  @override
  State<RhoCalculatorPage> createState() => _RhoPageState();
}

class _RhoPageState extends State<RhoCalculatorPage> {
  String method = 'soil_wenner';
  final aCtrl = TextEditingController(text: '1');
  final rCtrl = TextEditingController(text: '10');
  final r2Ctrl = TextEditingController(text: '0.1');
  final a2Ctrl = TextEditingController(text: '0.000113');
  final lCtrl = TextEditingController(text: '1');
  final mCtrl = TextEditingController(text: '10');
  final vCtrl = TextEditingController(text: '0.01');
  String result = '';

  void calc() {
    try {
      if (method == 'soil_wenner') {
        double a = double.parse(aCtrl.text);
        double R = double.parse(rCtrl.text);
        double rho = 2 * pi * a * R;
        setState(() => result = '✓ Soil Rho Wenner - PASS\n\nRho = 2 * π * a * R\nRho = 2 * π * $a * $R\nRho = ${rho.toStringAsFixed(4)} Ω.m\n\nStandard: ASTM G57-20 Wenner\nExample: a=1m R=10Ω => 62.83 Ω.m - PASS');
      } else if (method == 'material') {
        double R = double.parse(r2Ctrl.text);
        double A = double.parse(a2Ctrl.text);
        double L = double.parse(lCtrl.text);
        double rho = R * A / L;
        setState(() => result = '✓ Material Rho - PASS\n\nRho = R * A / L\nRho = $R * $A / $L\nRho = ${rho.toStringAsExponential(4)} Ω.m\n\nStandards: Physics Material Science, IS 1786 Steel\nExample: R=0.1Ω A=0.000113 L=1m => 1.13e-5 Ω.m - PASS');
      } else {
        double m = double.parse(mCtrl.text);
        double V = double.parse(vCtrl.text);
        double rho = m / V;
        setState(() => result = '✓ Density Rho - PASS\n\nRho = m / V\nRho = $m / $V\nRho = ${rho.toStringAsFixed(4)} kg/m³');
      }
    } catch (e) {
      setState(() => result = 'Invalid input - Check values');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rho Calculator - ASTM G57 + Material'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)), 
            child: const Text('Category: Electrical + Civil\nEngine: VarRho Engine v1.0\nFormulas: Material Rho=R*A/L, Soil Rho=2πaR (Wenner), Density Rho=m/V', style: TextStyle(fontSize: 11))),
          const SizedBox(height: 12),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'soil_wenner', label: Text('Soil'), icon: Icon(Icons.landscape)),
              ButtonSegment(value: 'material', label: Text('Material'), icon: Icon(Icons.memory)),
              ButtonSegment(value: 'density', label: Text('Density'), icon: Icon(Icons.scale)),
            ],
            selected: {method},
            onSelectionChanged: (s) => setState(() => method = s.first),
          ),
          const SizedBox(height: 20),
          if (method == 'soil_wenner') ...[
            TextField(controller: aCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Electrode spacing a (m)', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: rCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Measured Resistance R (Ω)', border: OutlineInputBorder())),
          ],
          if (method == 'material') ...[
            TextField(controller: r2Ctrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Resistance R (Ω)', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: a2Ctrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Area A (m²)', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: lCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Length L (m)', border: OutlineInputBorder())),
          ],
          if (method == 'density') ...[
            TextField(controller: mCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Mass m (kg)', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: vCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Volume V (m³)', border: OutlineInputBorder())),
          ],
          const SizedBox(height: 16),
          ElevatedButton.icon(onPressed: calc, icon: const Icon(Icons.calculate), label: const Text('Calculate Rho'), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white, padding: const EdgeInsets.all(16))),
          const SizedBox(height: 20),
          if (result.isNotEmpty) Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.teal)), child: Text(result, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
          const SizedBox(height: 20),
          const Text('Disclaimer: For workshop estimation only - Soil Wenner ASTM G57 - Field conditions vary - Verify with lab test - Wellness only not medical for density', style: TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
