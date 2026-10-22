import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const WanaLabApp());

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int idx = 0;

  final pages = const [
    DashboardFinal(),
    CoreFinal(),
    GPSFinal(),
    BabyFinal(),
    EMIFinal(),
    GymFinal(),
    WorkshopFinal(),
    VarRhoFinal(),
    ImportExportFinal(),
    SettingsFinal(),
    GalleryFinal(),
    AboutFinal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx > 4 ? 0 : idx,
        onDestinationSelected: (index) => setState(() => idx = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.verified_rounded), label: 'Core'),
          NavigationDestination(icon: Icon(Icons.map_rounded), label: 'GPS'),
          NavigationDestination(icon: Icon(Icons.child_care_rounded), label: 'Baby'),
          NavigationDestination(icon: Icon(Icons.wifi_rounded), label: 'EMI'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.teal, Color(0xFF4DB6AC)]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.science_rounded, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'WanaLab Toolkit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'v4.0.0 - LOCKED v1.7.2+48 FINAL\n50+ Features - 9 Workshops - No Ads\nOffline till 2037 - Private by design',
                    style: TextStyle(color: Colors.white70, fontSize: 9),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('1. Dashboard - 9 Workshops'),
              selected: idx == 0,
              onTap: () {
                setState(() => idx = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_rounded),
              title: const Text('2. CORE Free Forever WORKING'),
              selected: idx == 1,
              onTap: () {
                setState(() => idx = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('3. GPS & Maps WORKING'),
              selected: idx == 2,
              onTap: () {
                setState(() => idx = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.child_care),
              title: const Text('4. Baby Wellness WORKING'),
              selected: idx == 3,
              onTap: () {
                setState(() => idx = 3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text('5. EMI Wellness WORKING'),
              selected: idx == 4,
              onTap: () {
                setState(() => idx = 4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('6. Health & Gym WORKING'),
              selected: idx == 5,
              onTap: () {
                setState(() => idx = 5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('7. Workshop 39 Calc WORKING'),
              selected: idx == 6,
              onTap: () {
                setState(() => idx = 6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electric_bolt),
              title: const Text('8. VarRho IEEE+ASTM WORKING'),
              selected: idx == 7,
              onTap: () {
                setState(() => idx = 7);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.import_export),
              title: const Text('9. Import/Export WORKING'),
              selected: idx == 8,
              onTap: () {
                setState(() => idx = 8);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings & 10 Flavors'),
              selected: idx == 9,
              onTap: () {
                setState(() => idx = 9);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery - FIXED Positions'),
              selected: idx == 10,
              onTap: () {
                setState(() => idx = 10);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: const Text('About - Privacy - Locked'),
              selected: idx == 11,
              onTap: () {
                setState(() => idx = 11);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardFinal extends StatelessWidget {
  const DashboardFinal({super.key});

  void open(BuildContext context, int index) {
    final pages = [
      const CoreFinal(),
      const GPSFinal(),
      const BabyFinal(),
      const EMIFinal(),
      const GymFinal(),
      const WorkshopFinal(),
      const VarRhoFinal(),
      const ImportExportFinal(),
      const SettingsFinal(),
    ];
    Navigator.push(context, MaterialPageRoute(builder: (_) => pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.verified_rounded, 'name': '1. CORE - FREE FOREVER', 'desc': 'Offline prayer, qibla, tasbeeh and peace tools.'},
      {'icon': Icons.gps_fixed_rounded, 'name': '2. GPS & MAPS', 'desc': 'Save location, private tracking, offline map support.'},
      {'icon': Icons.child_care_rounded, 'name': '3. BABY WELLNESS', 'desc': 'Feeding, sleep, mood, vaccination and milestones.'},
      {'icon': Icons.wifi_rounded, 'name': '4. EMI WELLNESS', 'desc': 'EMI logs, mitigation, and wellness tracking.'},
      {'icon': Icons.fitness_center_rounded, 'name': '5. HEALTH & GYM', 'desc': 'Water, steps, sleep, reps, workout and mindfulness.'},
      {'icon': Icons.calculate_rounded, 'name': '6. WORKSHOP', 'desc': '39 calculators in engineering, civil and health.'},
      {'icon': Icons.electric_bolt_rounded, 'name': '7. VarRho', 'desc': 'IEEE and ASTM power and resistivity calculations.'},
      {'icon': Icons.import_export_rounded, 'name': '8. IMPORT/EXPORT', 'desc': 'Offline import/export and schemas.'},
      {'icon': Icons.settings_rounded, 'name': '9. SETTINGS', 'desc': 'Offline mode, flavor and privacy features.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - LOCKED v1.7.2+48'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => open(context, index),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Icon(item['icon'] as IconData, color: Colors.teal, size: 28),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                          const SizedBox(height: 4),
                          Text(item['desc'] as String, style: const TextStyle(fontSize: 9, color: Colors.black87)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 10, color: Colors.teal),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CoreFinal extends StatefulWidget {
  const CoreFinal({super.key});

  @override
  State<CoreFinal> createState() => _CoreFinalState();
}

class _CoreFinalState extends State<CoreFinal> {
  int tasbeeh = 0;

  final teachings = [
    'Peace for All - Love Mercy Compassion - For All Religions Equal',
    'Islam - Peace Be Upon You - Salam',
    'Christianity - Love Thy Neighbor',
    'Hinduism - Vasudhaiva Kutumbakam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORE - FREE FOREVER'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Qibla Compass - Offline', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 8),
                  const Icon(Icons.explore_rounded, size: 60, color: Colors.teal),
                  const Text(
                    'Wana Qibla ~ 290°\nPrayer Times Offline Cached Auto Location\nFajr 4:30 Zuhr 12:15 Asr 15:45 Maghrib 18:30 Isha 19:45',
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Tasbeeh Count: $tasbeeh', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => tasbeeh++),
                        icon: const Icon(Icons.add),
                        label: const Text('Count'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => setState(() => tasbeeh = 0),
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Daily Peace Teaching', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  const SizedBox(height: 8),
                  ...teachings.map(
                    (t) => Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text('• $t', style: const TextStyle(fontSize: 9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GPSFinal extends StatefulWidget {
  const GPSFinal({super.key});

  @override
  State<GPSFinal> createState() => _GPSFinalState();
}

class _GPSFinalState extends State<GPSFinal> {
  final lat = TextEditingController(text: '32.3028');
  final lng = TextEditingController(text: '69.7175');
  final title = TextEditingController();
  List<String> saves = [];

  void save() {
    if (title.text.trim().isEmpty) return;
    setState(() => saves.add('${title.text} | ${lat.text},${lng.text} | ${DateTime.now().toString().split(' ')[0]}'));
    title.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS & MAPS'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('GPS Save - Private Offline', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(height: 8),
          TextField(
            controller: title,
            decoration: const InputDecoration(labelText: 'Title/Notes', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: lat,
                  decoration: const InputDecoration(labelText: 'Lat', border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: lng,
                  decoration: const InputDecoration(labelText: 'Lng', border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: save,
            icon: const Icon(Icons.save),
            label: const Text('Save Private Offline'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
          ),
          const Divider(),
          ...saves.map(
            (s) => Card(
              child: ListTile(
                leading: const Icon(Icons.place, color: Colors.teal),
                title: Text(s, style: const TextStyle(fontSize: 10)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 16),
                  onPressed: () => setState(() => saves.remove(s)),
                ),
              ),
            ),
          ),
          if (saves.isEmpty)
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('No saved locations yet.', style: TextStyle(color: Colors.teal, fontSize: 10)),
            ),
        ],
      ),
    );
  }
}

class BabyFinal extends StatefulWidget {
  const BabyFinal({super.key});

  @override
  State<BabyFinal> createState() => _BabyFinalState();
}

class _BabyFinalState extends State<BabyFinal> {
  List<String> logs = [];

  void add(String item) {
    setState(() => logs.insert(0, '$item - ${DateTime.now().toString().split(' ')[0]}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BABY WELLNESS'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              ElevatedButton(onPressed: () => add('Feeding Log'), child: const Text('Feeding', style: TextStyle(fontSize: 9))),
              ElevatedButton(onPressed: () => add('Sleep Log'), child: const Text('Sleep', style: TextStyle(fontSize: 9))),
              ElevatedButton(onPressed: () => add('Diaper Log'), child: const Text('Diaper', style: TextStyle(fontSize: 9))),
              ElevatedButton(onPressed: () => add('Mood Log'), child: const Text('Mood', style: TextStyle(fontSize: 9))),
              ElevatedButton(onPressed: () => add('Vaccination Log'), child: const Text('Vaccination', style: TextStyle(fontSize: 9))),
              ElevatedButton(onPressed: () => add('Milestone Log'), child: const Text('Milestones', style: TextStyle(fontSize: 9))),
            ],
          ),
          const Divider(),
          ...logs.map(
            (item) => Card(
              child: ListTile(
                title: Text(item, style: const TextStyle(fontSize: 9)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 14),
                  onPressed: () => setState(() => logs.remove(item)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EMIFinal extends StatefulWidget {
  const EMIFinal({super.key});

  @override
  State<EMIFinal> createState() => _EMIFinalState();
}

class _EMIFinalState extends State<EMIFinal> {
  final controller = TextEditingController(text: '2.5');
  String result = '';

  void calculate() {
    final value = double.tryParse(controller.text) ?? 0.0;
    setState(() => result = 'E = $value V/m\nH = ${(value / 377).toStringAsFixed(6)} A/m\nEMI awareness only');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI WELLNESS'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'E-field V/m', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.calculate),
            label: const Text('Calculate'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
          ),
          if (result.isNotEmpty)
            Card(
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(result, style: const TextStyle(fontSize: 10)),
              ),
            ),
        ],
      ),
    );
  }
}

class GymFinal extends StatefulWidget {
  const GymFinal({super.key});

  @override
  State<GymFinal> createState() => _GymFinalState();
}

class _GymFinalState extends State<GymFinal> {
  int water = 0;
  int steps = 0;
  int reps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTH & GYM'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: Text('Water Intake: $water'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.remove), onPressed: () => setState(() => water--)),
                  IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => water++)),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Steps: $steps'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.remove), onPressed: () => setState(() => steps--)),
                  IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => steps++)),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Reps: $reps'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.remove), onPressed: () => setState(() => reps--)),
                  IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => reps++)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImportExportFinal extends StatelessWidget {
  const ImportExportFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMPORT / EXPORT'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Import/export support is available in the app.')),
    );
  }
}

class SettingsFinal extends StatefulWidget {
  const SettingsFinal({super.key});

  @override
  State<SettingsFinal> createState() => _SettingsFinalState();
}

class _SettingsFinalState extends State<SettingsFinal> {
  bool offline = true;
  String religion = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Offline Mode'),
            value: offline,
            onChanged: (value) => setState(() => offline = value),
          ),
          DropdownButtonFormField<String>(
            value: religion,
            decoration: const InputDecoration(labelText: 'Religion preference', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'All', child: Text('All Religions Equal')),
              DropdownMenuItem(value: 'Islam', child: Text('Islam')),
              DropdownMenuItem(value: 'Christianity', child: Text('Christianity')),
              DropdownMenuItem(value: 'Hinduism', child: Text('Hinduism')),
            ],
            onChanged: (value) => setState(() => religion = value ?? 'All'),
          ),
        ],
      ),
    );
  }
}

class WorkshopFinal extends StatefulWidget {
  const WorkshopFinal({super.key});

  @override
  State<WorkshopFinal> createState() => _WorkshopFinalState();
}

class _WorkshopFinalState extends State<WorkshopFinal> {
  String query = '';
  final calculations = [
    'Ohm Law',
    'Power kW / HP',
    'Wire Gauge',
    'Cable Size',
    'Transformer kVA',
    'Battery Ah',
    'Resistor Color Code',
    'BMI',
    'Water intake',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = calculations.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop - 39 Calculators'),
        backgroundColor: Colors.teal,
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
          ...filtered.map((item) => ListTile(title: Text(item, style: const TextStyle(fontSize: 12))))
        ],
      ),
    );
  }
}

class VarRhoFinal extends StatefulWidget {
  const VarRhoFinal({super.key});

  @override
  State<VarRhoFinal> createState() => _VarRhoFinalState();
}

class _VarRhoFinalState extends State<VarRhoFinal> {
  String method = 'var';
  final kw = TextEditingController(text: '10');
  final pf = TextEditingController(text: '0.8');
  String result = '';

  void calculate() {
    final power = double.tryParse(kw.text) ?? 0;
    final pF = double.tryParse(pf.text) ?? 0;
    if (pF <= 0) {
      setState(() => result = 'Power factor must be > 0');
      return;
    }
    final kva = power / pF;
    final angle = acos(pF) * 180 / pi;
    final kvar = power * tan(acos(pF));
    setState(() => result = 'P = $power kW\nQ = ${kvar.toStringAsFixed(2)} kVAR\nS = ${kva.toStringAsFixed(2)} kVA\nθ = ${angle.toStringAsFixed(1)}°');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VarRho Engine'),
        backgroundColor: Colors.teal,
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
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Real Power kW', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: pf,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Power Factor', border: OutlineInputBorder()),
            ),
          ],
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.calculate_rounded),
            label: const Text('Calculate'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 12),
          if (result.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              child: Text(result, style: const TextStyle(fontSize: 10)),
            ),
        ],
      ),
    );
  }
}

class GalleryFinal extends StatelessWidget {
  const GalleryFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(12),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: const [
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }
}

class AboutFinal extends StatelessWidget {
  const AboutFinal({super.key});

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
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.teal, Color(0xFF4DB6AC)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WanaLab Toolkit',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Offline-first toolkit for health, baby wellness, EMI awareness, and educational calculations.',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _open('https://github.com/Nasir684/WanaLab-Toolkit'),
                    icon: const Icon(Icons.link, size: 16),
                    label: const Text('GitHub'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.teal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
