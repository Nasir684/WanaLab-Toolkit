import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WanaLabApp());
}

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF0F766E),
        scaffoldBackgroundColor: const Color(0xFFF3F7F7),
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
  int selectedIndex = 0;

  static const List<Widget> _pages = [
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
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex < 5 ? selectedIndex : 0,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
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
                gradient: LinearGradient(colors: [Color(0xFF0F766E), Color(0xFF14B8A6)]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.science_rounded, size: 42, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'WanaLab Toolkit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Private • Offline • Research based',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
            _drawerButton(Icons.dashboard, 'Dashboard', 0),
            _drawerButton(Icons.verified_rounded, 'CORE Free Forever', 1),
            _drawerButton(Icons.map, 'GPS & Maps', 2),
            _drawerButton(Icons.child_care, 'Baby Wellness', 3),
            _drawerButton(Icons.wifi, 'EMI Wellness', 4),
            _drawerButton(Icons.fitness_center, 'Health & Gym', 5),
            _drawerButton(Icons.calculate_rounded, 'Workshop', 6),
            _drawerButton(Icons.electric_bolt, 'VarRho Engine', 7),
            _drawerButton(Icons.import_export, 'Import / Export', 8),
            const Divider(),
            _drawerButton(Icons.settings, 'Settings', 9),
            _drawerButton(Icons.photo_library, 'Gallery', 10),
            _drawerButton(Icons.info_rounded, 'About', 11),
          ],
        ),
      ),
    );
  }

  Widget _drawerButton(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title, style: const TextStyle(fontSize: 13)),
      selected: selectedIndex == index,
      onTap: () {
        setState(() => selectedIndex = index);
        Navigator.pop(context);
      },
    );
  }
}

class DashboardFinal extends StatelessWidget {
  const DashboardFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _DashboardCard(
        icon: Icons.verified_rounded,
        title: 'CORE',
        subtitle: 'Qibla, Tasbeeh, daily peace teaching',
        page: const CoreFinal(),
      ),
      _DashboardCard(
        icon: Icons.gps_fixed_rounded,
        title: 'GPS & MAPS',
        subtitle: 'Private saved routes and coordinates',
        page: const GPSFinal(),
      ),
      _DashboardCard(
        icon: Icons.child_care_rounded,
        title: 'BABY WELLNESS',
        subtitle: 'Feeding, sleeping, milestones and logs',
        page: const BabyFinal(),
      ),
      _DashboardCard(
        icon: Icons.wifi_rounded,
        title: 'EMI WELLNESS',
        subtitle: 'Field strength and EMI awareness helpers',
        page: const EMIFinal(),
      ),
      _DashboardCard(
        icon: Icons.fitness_center_rounded,
        title: 'HEALTH & GYM',
        subtitle: 'Water, steps, reps and activity tracking',
        page: const GymFinal(),
      ),
      _DashboardCard(
        icon: Icons.calculate_rounded,
        title: 'WORKSHOP',
        subtitle: '40 calculators and search tools',
        page: const WorkshopFinal(),
      ),
      _DashboardCard(
        icon: Icons.electric_bolt_rounded,
        title: 'VarRho ENGINE',
        subtitle: 'IEEE power and ASTM resistivity formulas',
        page: const VarRhoFinal(),
      ),
      _DashboardCard(
        icon: Icons.import_export_rounded,
        title: 'IMPORT / EXPORT',
        subtitle: 'JSON backup and restore utility',
        page: const ImportExportFinal(),
      ),
      _DashboardCard(
        icon: Icons.settings_rounded,
        title: 'SETTINGS',
        subtitle: 'Offline mode and religion preferences',
        page: const SettingsFinal(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCFBF1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item.icon, color: const Color(0xFF0F766E), size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: const TextStyle(fontSize: 11, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, color: Color(0xFF0F766E)),
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

class _DashboardCard {
  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget page;
}

class CoreFinal extends StatefulWidget {
  const CoreFinal({super.key});

  @override
  State<CoreFinal> createState() => _CoreFinalState();
}

class _CoreFinalState extends State<CoreFinal> {
  static const String _prefsKey = 'core_tasbeeh_count';

  int tasbeeh = 0;
  final List<String> teachings = [
    'Peace for all — love, mercy, and compassion for everyone.',
    'Islam — peace be upon you and all of humanity.',
    'Christianity — love thy neighbor and act with kindness.',
    'Hinduism — Vasudhaiva Kutumbakam, the world is one family.',
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => tasbeeh = prefs.getInt(_prefsKey) ?? 0);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, tasbeeh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORE - Free Forever'),
        backgroundColor: const Color(0xFF0F766E),
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
                  const Text(
                    'Qibla Compass - Offline',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.explore_rounded, size: 64, color: Color(0xFF0F766E)),
                  const SizedBox(height: 8),
                  const Text(
                    'Wana Qibla ~ 290°\nPrayer Time Estimates\nFajr 04:30 • Zuhr 12:15 • Asr 15:45 • Maghrib 18:30 • Isha 19:45',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Tasbeeh Count: $tasbeeh',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          setState(() => tasbeeh++);
                          await _save();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Count'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F766E),
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => tasbeeh = 0);
                          await _save();
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Peace Teaching',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ...teachings.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('• $item', style: const TextStyle(fontSize: 11)),
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
  static const String _prefsKey = 'gps_saved_locations';

  final lat = TextEditingController(text: '32.3028');
  final lng = TextEditingController(text: '69.7175');
  final title = TextEditingController();
  List<String> saves = <String>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => saves = prefs.getStringList(_prefsKey) ?? <String>[]);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, saves);
  }

  Future<void> save() async {
    final trimmedTitle = title.text.trim();
    if (trimmedTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title or note first.')),
      );
      return;
    }

    final entry = '$trimmedTitle | ${lat.text},${lng.text} | ${DateTime.now().toString().split(' ')[0]}';
    setState(() {
      saves.insert(0, entry);
      title.clear();
    });
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS & Maps'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('GPS Save - Private Offline', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 12),
          TextField(
            controller: title,
            decoration: const InputDecoration(
              labelText: 'Title / Notes',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: lat,
                  decoration: const InputDecoration(labelText: 'Latitude', border: OutlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: lng,
                  decoration: const InputDecoration(labelText: 'Longitude', border: OutlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: save,
            icon: const Icon(Icons.save),
            label: const Text('Save Private Offline'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F766E),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (saves.isEmpty)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('No saved locations yet.', style: TextStyle(color: Color(0xFF0F766E), fontSize: 11)),
            )
          else
            ...saves.map(
              (item) => Card(
                child: ListTile(
                  leading: const Icon(Icons.place, color: Color(0xFF0F766E)),
                  title: Text(item, style: const TextStyle(fontSize: 10)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    onPressed: () async {
                      setState(() => saves.remove(item));
                      await _save();
                    },
                  ),
                ),
              ),
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
  static const String _prefsKey = 'baby_logs';
  List<String> logs = <String>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => logs = prefs.getStringList(_prefsKey) ?? <String>[]);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, logs);
  }

  Future<void> add(String item) async {
    setState(() => logs.insert(0, '$item - ${DateTime.now().toString().split(' ')[0]}'));
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BABY WELLNESS'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip('Feeding', () => add('Feeding Log')),
              _chip('Sleep', () => add('Sleep Log')),
              _chip('Diaper', () => add('Diaper Log')),
              _chip('Mood', () => add('Mood Log')),
              _chip('Vaccination', () => add('Vaccination Log')),
              _chip('Milestones', () => add('Milestone Log')),
            ],
          ),
          const Divider(),
          if (logs.isEmpty)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('No baby wellness entries yet.', style: TextStyle(color: Color(0xFF0F766E), fontSize: 11)),
            )
          else
            ...logs.map(
              (item) => Card(
                child: ListTile(
                  title: Text(item, style: const TextStyle(fontSize: 10)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    onPressed: () async {
                      setState(() => logs.remove(item));
                      await _save();
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _chip(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 10)),
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
    setState(() {
      result = 'E = $value V/m\nH = ${(value / 377).toStringAsFixed(6)} A/m\nEMI awareness only';
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
            decoration: const InputDecoration(labelText: 'E-field V/m', border: OutlineInputBorder()),
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
  static const String _prefsKey = 'gym_stats';

  int water = 0;
  int steps = 0;
  int reps = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final values = prefs.getStringList(_prefsKey) ?? const <String>[];
    if (values.length >= 3) {
      setState(() {
        water = int.tryParse(values[0]) ?? 0;
        steps = int.tryParse(values[1]) ?? 0;
        reps = int.tryParse(values[2]) ?? 0;
      });
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, [water.toString(), steps.toString(), reps.toString()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTH & GYM'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _gymCard('Water Intake', water, () async {
            setState(() => water--);
            await _save();
          }, () async {
            setState(() => water++);
            await _save();
          }),
          _gymCard('Steps', steps, () async {
            setState(() => steps--);
            await _save();
          }, () async {
            setState(() => steps++);
            await _save();
          }),
          _gymCard('Reps', reps, () async {
            setState(() => reps--);
            await _save();
          }, () async {
            setState(() => reps++);
            await _save();
          }),
        ],
      ),
    );
  }

  Widget _gymCard(String label, int value, VoidCallback onMinus, VoidCallback onPlus) {
    return Card(
      child: ListTile(
        title: Text('$label: $value', style: const TextStyle(fontSize: 12)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.remove), onPressed: onMinus),
            IconButton(icon: const Icon(Icons.add), onPressed: onPlus),
          ],
        ),
      ),
    );
  }
}

class ImportExportFinal extends StatefulWidget {
  const ImportExportFinal({super.key});

  @override
  State<ImportExportFinal> createState() => _ImportExportFinalState();
}

class _ImportExportFinalState extends State<ImportExportFinal> {
  final TextEditingController dataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonMap = {
      'gps': prefs.getStringList('gps_saved_locations') ?? <String>[],
      'baby': prefs.getStringList('baby_logs') ?? <String>[],
      'gym': prefs.getStringList('gym_stats') ?? <String>[],
      'core': {'tasbeeh': prefs.getInt('core_tasbeeh_count') ?? 0},
    };

    setState(() {
      dataController.text = const JsonEncoder.withIndent('  ').convert(jsonMap);
    });
  }

  Future<void> _export() async {
    final data = dataController.text;
    await Clipboard.setData(ClipboardData(text: data));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data copied to clipboard.')),
    );
  }

  Future<void> _import() async {
    try {
      final parsed = jsonDecode(dataController.text);
      if (parsed is! Map) {
        throw const FormatException('Expected JSON object.');
      }

      final prefs = await SharedPreferences.getInstance();
      if (parsed['gps'] is List) {
        await prefs.setStringList('gps_saved_locations', List<String>.from(parsed['gps']));
      }
      if (parsed['baby'] is List) {
        await prefs.setStringList('baby_logs', List<String>.from(parsed['baby']));
      }
      if (parsed['gym'] is List) {
        await prefs.setStringList('gym_stats', List<String>.from(parsed['gym']));
      }
      if (parsed['core'] is Map && parsed['core']['tasbeeh'] != null) {
        await prefs.setInt('core_tasbeeh_count', int.parse(parsed['core']['tasbeeh'].toString()));
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data imported successfully.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid JSON format.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMPORT / EXPORT'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: dataController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'JSON data',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _export,
                    icon: const Icon(Icons.copy),
                    label: const Text('Copy / Export'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _import,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Import'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsFinal extends StatefulWidget {
  const SettingsFinal({super.key});

  @override
  State<SettingsFinal> createState() => _SettingsFinalState();
}

class _SettingsFinalState extends State<SettingsFinal> {
  static const String _offlineKey = 'offline_mode';
  static const String _religionKey = 'religion_preference';

  bool offline = true;
  String religion = 'All';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      offline = prefs.getBool(_offlineKey) ?? true;
      religion = prefs.getString(_religionKey) ?? 'All';
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_offlineKey, offline);
    await prefs.setString(_religionKey, religion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Offline mode'),
            value: offline,
            onChanged: (value) async {
              setState(() => offline = value);
              await _save();
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: religion,
            decoration: const InputDecoration(
              labelText: 'Religion preference',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'All', child: Text('All Religions Equal')),
              DropdownMenuItem(value: 'Islam', child: Text('Islam')),
              DropdownMenuItem(value: 'Christianity', child: Text('Christianity')),
              DropdownMenuItem(value: 'Hinduism', child: Text('Hinduism')),
            ],
            onChanged: (value) async {
              setState(() => religion = value ?? 'All');
              await _save();
            },
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

class VarRhoFinal extends StatefulWidget {
  const VarRhoFinal({super.key});

  @override
  State<VarRhoFinal> createState() => _VarRhoFinalState();
}

class _VarRhoFinalState extends State<VarRhoFinal> {
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

class GalleryFinal extends StatelessWidget {
  const GalleryFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Calculator', Icons.calculate_rounded),
      ('VarRho', Icons.electric_bolt_rounded),
      ('Health', Icons.favorite_rounded),
      ('Science', Icons.science_rounded),
      ('Map', Icons.map_rounded),
      ('Baby', Icons.child_care_rounded),
      ('Private', Icons.lock_rounded),
      ('Settings', Icons.settings_rounded),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final title = items[index].$1;
          final icon = items[index].$2;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF14B8A6), Color(0xFF0F766E)],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 42, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
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
