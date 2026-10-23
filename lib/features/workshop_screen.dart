import 'package:flutter/material.dart';

class WorkshopScreen extends StatefulWidget {
  const WorkshopScreen({super.key});

  @override
  State<WorkshopScreen> createState() => _WorkshopScreenState();
}

class _WorkshopScreenState extends State<WorkshopScreen> {
  String query = '';
  String selectedCategory = 'All';

  static const List<_CategoryData> categories = [
    _CategoryData('All', Icons.apps_rounded, 'All calculators', 'all'),
    _CategoryData(
      'Electrical & Power',
      Icons.electrical_services_rounded,
      'VAR, Ohm, power & resistivity',
      'electrical',
    ),
    _CategoryData(
      'Civil & Structural',
      Icons.construction_rounded,
      'Concrete, beam, force & stress',
      'civil',
    ),
    _CategoryData(
      'Physics & Materials',
      Icons.science_rounded,
      'Rho, density, capacitance & more',
      'physics',
    ),
    _CategoryData(
      'Math & Conversions',
      Icons.calculate_rounded,
      'Area, volume, time & unit tools',
      'math',
    ),
    _CategoryData(
      'Health & Wellness',
      Icons.favorite_rounded,
      'BMI and daily wellness helpers',
      'health',
    ),
    _CategoryData(
      'Geotech & Soil',
      Icons.terrain_rounded,
      'Wenner, soil & field estimation',
      'geo',
    ),
  ];

  static const List<_CalculatorEntry> allCalculators = [
    _CalculatorEntry(
      'Ohm Law',
      'Electrical & Power',
      'V = I × R',
      'Voltage, current and resistance relationship.',
      'electrical',
    ),
    _CalculatorEntry(
      'Power kW / HP',
      'Electrical & Power',
      'HP = kW × 1.341',
      'Power conversion between kilowatts and horsepower.',
      'electrical',
    ),
    _CalculatorEntry(
      'Power Factor',
      'Electrical & Power',
      'PF = kW / kVA',
      'Reactive power and phase angle estimation.',
      'electrical',
    ),
    _CalculatorEntry(
      'VAR / Reactive Power',
      'Electrical & Power',
      'kVAR = kW × tan(acos(PF))',
      'IEEE power triangle and reactive power analysis.',
      'electrical',
    ),
    _CalculatorEntry(
      'Voltage Divider',
      'Electrical & Power',
      'Vout = Vin × R2 / (R1 + R2)',
      'Simple resistor network voltage split.',
      'electrical',
    ),
    _CalculatorEntry(
      'Current Divider',
      'Electrical & Power',
      'I1 = Itotal × R2 / (R1 + R2)',
      'Current split in parallel branch network.',
      'electrical',
    ),
    _CalculatorEntry(
      'Transformer kVA',
      'Electrical & Power',
      'kVA = V × I / 1000',
      'Transformer sizing based on voltage and current.',
      'electrical',
    ),
    _CalculatorEntry(
      'Battery Ah',
      'Electrical & Power',
      'Ah = Current × Hours',
      'Battery capacity and backup duration estimation.',
      'electrical',
    ),
    _CalculatorEntry(
      'Cable Size',
      'Electrical & Power',
      'I = Power / Voltage',
      'Cable selection and current load estimate.',
      'electrical',
    ),
    _CalculatorEntry(
      'Wire Gauge',
      'Electrical & Power',
      'AWG ↔ mm² conversion',
      'Electrical conductor sizing reference.',
      'electrical',
    ),
    _CalculatorEntry(
      'Safety Factor',
      'Electrical & Power',
      'SF = Capacity / Load',
      'Design safety margin estimate.',
      'electrical',
    ),
    _CalculatorEntry(
      'Energy Cost',
      'Electrical & Power',
      'Cost = kWh × tariff',
      'Power consumption cost estimate.',
      'electrical',
    ),
    _CalculatorEntry(
      'Resistivity / Rho',
      'Physics & Materials',
      'ρ = R × A / L',
      'Material resistivity from resistance, area and length.',
      'physics',
    ),
    _CalculatorEntry(
      'Soil Resistivity (Wenner)',
      'Geotech & Soil',
      'ρ = 2πaR',
      'ASTM Wenner soil resistivity estimation.',
      'geo',
    ),
    _CalculatorEntry(
      'Capacitance',
      'Physics & Materials',
      'C = Q / V',
      'Capacitor charge estimation and relation.',
      'physics',
    ),
    _CalculatorEntry(
      'Inductance',
      'Physics & Materials',
      'V = L × di/dt',
      'Inductor voltage relation and sizing check.',
      'physics',
    ),
    _CalculatorEntry(
      'Thermal Capacity',
      'Physics & Materials',
      'Q = m × c × ΔT',
      'Heat capacity and thermal energy calculations.',
      'physics',
    ),
    _CalculatorEntry(
      'Solar Energy',
      'Physics & Materials',
      'E = P × time',
      'Solar output and energy estimate.',
      'physics',
    ),
    _CalculatorEntry(
      'Concrete Mix',
      'Civil & Structural',
      '1:2:4 ratio',
      'Concrete mix proportion estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Beam Design',
      'Civil & Structural',
      'M = W × L / 8',
      'Beam bending estimate and load check.',
      'civil',
    ),
    _CalculatorEntry(
      'Rebar Quantity',
      'Civil & Structural',
      'Weight = volume × density',
      'Steel reinforcement quantity estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Stress',
      'Civil & Structural',
      'σ = F / A',
      'Stress under axial load.',
      'civil',
    ),
    _CalculatorEntry(
      'Strain',
      'Civil & Structural',
      'ε = ΔL / L',
      'Deformation ratio estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Force',
      'Civil & Structural',
      'F = m × a',
      'Newton force estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Torque',
      'Civil & Structural',
      'T = F × r',
      'Rotational moment estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Gear Ratio',
      'Civil & Structural',
      'GR = teeth_out / teeth_in',
      'Mechanical ratio estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Brake Power',
      'Civil & Structural',
      'BHP = Torque × RPM / 5252',
      'Mechanical power estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Pressure Drop',
      'Civil & Structural',
      'ΔP = f × L × v² / (2gd)',
      'Fluid flow pressure loss estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Pipe Size',
      'Civil & Structural',
      'Q = A × v',
      'Hydraulic pipe sizing estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Flow Rate',
      'Civil & Structural',
      'Q = Volume / Time',
      'System flow and discharge estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Heat Loss',
      'Civil & Structural',
      'Q = U × A × ΔT',
      'Thermal losses through surfaces.',
      'civil',
    ),
    _CalculatorEntry(
      'Air Flow',
      'Civil & Structural',
      'Q = A × v',
      'Air movement and ventilation estimate.',
      'civil',
    ),
    _CalculatorEntry(
      'Ventilation',
      'Civil & Structural',
      'Air change rate = airflow / room volume',
      'Ventilation design reference.',
      'civil',
    ),
    _CalculatorEntry(
      'Distance',
      'Math & Conversions',
      'd = v × t',
      'Distance estimate with speed and time.',
      'math',
    ),
    _CalculatorEntry(
      'Area',
      'Math & Conversions',
      'A = L × W',
      'Rectangle and planar area conversion.',
      'math',
    ),
    _CalculatorEntry(
      'Volume',
      'Math & Conversions',
      'V = L × W × H',
      'Volume and capacity conversions.',
      'math',
    ),
    _CalculatorEntry(
      'Time Converter',
      'Math & Conversions',
      'seconds ↔ minutes ↔ hours',
      'Convert between time units.',
      'math',
    ),
    _CalculatorEntry(
      'Weight Converter',
      'Math & Conversions',
      'kg ↔ lb',
      'Weight conversion between units.',
      'math',
    ),
    _CalculatorEntry(
      'Temperature Converter',
      'Math & Conversions',
      '°F = (°C × 9/5) + 32',
      'Temperature conversion between common scales.',
      'math',
    ),
    _CalculatorEntry(
      'BMI',
      'Health & Wellness',
      'BMI = kg / m²',
      'Body mass index calculation.',
      'health',
    ),
    _CalculatorEntry(
      'Water Intake',
      'Health & Wellness',
      'L = body weight × multiplier',
      'Daily hydration estimate.',
      'health',
    ),
    _CalculatorEntry(
      'Density',
      'Physics & Materials',
      'ρ = m / V',
      'Density of materials and objects.',
      'physics',
    ),
    _CalculatorEntry(
      'Pressure Drop',
      'Geotech & Soil',
      'ΔP = fluid loss estimate',
      'Groundwater and field pressure relation.',
      'geo',
    ),
  ];

  List<_CalculatorEntry> get filteredCalculators {
    final lower = query.trim().toLowerCase();

    final source = selectedCategory == 'All'
        ? allCalculators
        : allCalculators
            .where((item) => item.category == selectedCategory)
            .toList();

    if (lower.isEmpty) {
      return source;
    }

    return source
        .where((item) =>
            item.name.toLowerCase().contains(lower) ||
            item.formula.toLowerCase().contains(lower) ||
            item.category.toLowerCase().contains(lower))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final categoryCards = categories.where((item) => item.name != 'All').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Categories'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search calculators',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (value) => setState(() => query = value),
            ),
          ),
          SizedBox(
            height: 56,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category.name;
                final count = category.name == 'All'
                    ? allCalculators.length
                    : allCalculators
                        .where((item) => item.category == category.name)
                        .length;

                return ChoiceChip(
                  label: Text('${category.name} ($count)'),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedCategory = category.name),
                  selectedColor: const Color(0xFFCCFBF1),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: isSelected ? const Color(0xFF0F766E) : Colors.grey.shade300,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          if (selectedCategory == 'All')
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: categoryCards.length,
                itemBuilder: (context, index) {
                  final category = categoryCards[index];
                  final count = allCalculators
                      .where((item) => item.category == category.name)
                      .length;

                  return InkWell(
                    onTap: () => setState(() => selectedCategory = category.name),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFF0F766E).withOpacity(0.2)),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFCCFBF1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(category.icon, color: const Color(0xFF0F766E), size: 28),
                          ),
                          const Spacer(),
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$count calculators',
                            style: const TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.subtitle,
                            style: const TextStyle(fontSize: 10, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemCount: filteredCalculators.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = filteredCalculators[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.calculate_rounded,
                        color: Color(0xFF0F766E),
                      ),
                      title: Text(item.name, style: const TextStyle(fontSize: 12)),
                      subtitle: Text(
                        '${item.category} • ${item.formula}',
                        style: const TextStyle(fontSize: 10),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(item.name),
                            content: Text(
                              '${item.description}\n\nFormula: ${item.formula}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryData {
  const _CategoryData(this.name, this.icon, this.subtitle, this.key);

  final String name;
  final IconData icon;
  final String subtitle;
  final String key;
}

class _CalculatorEntry {
  const _CalculatorEntry(
    this.name,
    this.category,
    this.formula,
    this.description,
    this.key,
  );

  final String name;
  final String category;
  final String formula;
  final String description;
  final String key;
}
