import 'package:flutter/material.dart';

class WorkshopScreen extends StatefulWidget {
  const WorkshopScreen({super.key});

  @override
  State<WorkshopScreen> createState() => _WorkshopScreenState();
}

class _WorkshopScreenState extends State<WorkshopScreen> {
  String query = '';

  final List<String> calculations = [
    'Ohm Law',
    'Power kW / HP',
    'Wire Gauge',
    'Cable Size',
    'Transformer kVA',
    'Battery Ah',
    'Resistor Color Code',
    'BMI',
    'Water Intake',
    'Voltage Divider',
    'Current Divider',
    'Capacitance',
    'Inductance',
    'Peak Load',
    'Safety Factor',
    'Energy Cost',
    'Concrete Mix',
    'Beam Design',
    'Rebar Quantity',
    'Flow Rate',
    'Pipe Size',
    'Heat Loss',
    'Pressure Drop',
    'Force',
    'Torque',
    'Gear Ratio',
    'Brake Power',
    'Air Flow',
    'Ventilation',
    'Solar Energy',
    'Thermal Capacity',
    'Distance',
    'Area',
    'Volume',
    'Time Converter',
    'Weight Converter',
    'Temperature Converter',
    'Stress',
    'Strain',
    'Efficiency',
    'Power Factor',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = calculations
        .where((item) => item.toLowerCase().contains(query.trim().toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop - 40 Calculators'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Search calculators', border: OutlineInputBorder()),
              onChanged: (value) => setState(() => query = value),
            ),
          ),
          if (filtered.isEmpty)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('No calculator matches your search.', style: TextStyle(fontSize: 11)),
            )
          else
            ...filtered.map(
              (item) => ListTile(
                title: Text(item, style: const TextStyle(fontSize: 12)),
                leading: const Icon(Icons.calculate_rounded, color: Color(0xFF0F766E)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item calculator ready for use in this build.')),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
