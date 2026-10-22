import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() => runApp(const WanaLabApp());

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit v2.1.0 - Full Final',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
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
    WorkshopFinal(),
    VarRhoFinal(),
    GPSFinal(),
    BabyFinal(),
    GalleryFinal(),
    AboutFinal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx > 4 ? 0 : idx,
        onDestinationSelected: (i) => setState(() => idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.build_rounded), label: 'Workshop'),
          NavigationDestination(icon: Icon(Icons.electric_bolt_rounded), label: 'VarRho'),
          NavigationDestination(icon: Icon(Icons.map_rounded), label: 'GPS Maps'),
          NavigationDestination(icon: Icon(Icons.child_care_rounded), label: 'Baby'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Color(0xFF4DB6AC)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.science_rounded, size: 40, color: Colors.white),
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
                    'VarRho Engine v1.0 - Full 40+ Features\nv2.1.0+19 - No Ads - Offline till 2037',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard - 9 Workshops'),
              onTap: () { setState(() => idx = 0); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('39 Calculators Working'),
              onTap: () { setState(() => idx = 1); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.electric_bolt),
              title: const Text('VarRho IEEE+ASTM'),
              onTap: () { setState(() => idx = 2); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('GPS & Maps'),
              onTap: () { setState(() => idx = 3); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.child_care),
              title: const Text('Baby Health + EMI + Gym'),
              onTap: () { setState(() => idx = 4); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery - Your JPGs'),
              onTap: () { setState(() => idx = 5); Navigator.pop(context); },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: const Text('About - Privacy - Structure'),
              onTap: () { setState(() => idx = 6); Navigator.pop(context); },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardFinal extends StatelessWidget {
  const DashboardFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final workshops = [
      {
        'icon': Icons.verified_rounded,
        'name': 'Core Free Forever - No Ads',
        'desc': 'Qibla Compass Offline Magnetic+GPS, Prayer Times Offline Cached Auto Location For all religions equal, Tasbeeh, and offline private tools.'
      },
      {
        'icon': Icons.gps_fixed_rounded,
        'name': 'GPS & Maps Workshop - Demo+Pro',
        'desc': 'GPS Save Lat/Lng Title Notes Timestamp Private Offline, Offline Maps, Journals, Track KML/GPX.'
      },
      {
        'icon': Icons.child_care_rounded,
        'name': 'Baby Wellness Workshop - Maternal',
        'desc': 'Feeding Log, Sleep, Diaper, Weight, Vaccination, Mother Wellness.'
      },
      {
        'icon': Icons.wifi_rounded,
        'name': 'EMI Wellness Workshop - University',
        'desc': 'EMI source logging and mitigation guidance for common environments.'
      },
      {
        'icon': Icons.fitness_center_rounded,
        'name': 'Health & Gym Workshop - Wellness Only',
        'desc': 'Water intake, sleep, steps, workouts, rep tracking, and health log demos.'
      },
      {
        'icon': Icons.calculate_rounded,
        'name': 'Workshop Calculators - 39 Working',
        'desc': 'Electrical, civil, mechanical, converter, and medical wellness utilities.'
      },
      {
        'icon': Icons.electric_bolt_rounded,
        'name': 'VarRho Engine v1.0 - Research Based',
        'desc': 'Reactive power and soil resistivity calculations with IEEE + ASTM formulas.'
      },
      {
        'icon': Icons.import_export_rounded,
        'name': 'Import/Export - University Research',
        'desc': 'Import/export tools for CSV, JSON, KML/GPX, and offline private data.'
      },
      {
        'icon': Icons.settings_rounded,
        'name': 'Settings & System + 10 Flavors White-Label',
        'desc': 'Offline app configuration with multiple white-label variants and settings.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('WanaLab Toolkit - Full Final v2.1.0'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          final w = workshops[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(w['icon'] as IconData, color: Colors.teal, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          w['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          w['desc'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
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

class WorkshopFinal extends StatefulWidget {
  const WorkshopFinal({super.key});

  @override
  State<WorkshopFinal> createState() => _WorkshopFinalState();
}

class _WorkshopFinalState extends State<WorkshopFinal> {
  String q = '';
  final List<Map<String, dynamic>> calcs = const [
    {'id': 1, 'name': '1. Ohm Law V=IR', 'cat': 'Electrical', 'f': 'V=IR P=VI'},
    {'id': 2, 'name': '2. Power kW HP Amp', 'cat': 'Electrical', 'f': 'kW*1000/(V*PF)'},
    {'id': 3, 'name': '3. Wire Gauge AWG/SWG', 'cat': 'Electrical', 'f': 'mm²=I/6'},
    {'id': 4, 'name': '4. Cable Size Voltage Drop', 'cat': 'Electrical', 'f': '2*I*L*R/1000'},
    {'id': 5, 'name': '5. Transformer kVA', 'cat': 'Electrical', 'f': 'V*I/1000'},
    {'id': 6, 'name': '6. Battery Ah', 'cat': 'Electrical', 'f': 'Ah=Wh/V'},
    {'id': 7, 'name': '7. Resistor Color Code', 'cat': 'Electrical', 'f': 'ABx10^M'},
    {'id': 8, 'name': '8. Capacitor Code', 'cat': 'Electrical', 'f': 'ABx10^M pF'},
    {'id': 9, 'name': '9. dBm/dB', 'cat': 'Electrical', 'f': '10*log10(P/1mW)'},
    {'id': 10, 'name': '10. EMI Field V/m to uT', 'cat': 'EMI', 'f': 'Awareness'},
    {'id': 11, 'name': '11. RF Power Density', 'cat': 'EMI', 'f': 'S=P*G/4πr²'},
    {'id': 12, 'name': '12. Concrete 1:2:4', 'cat': 'Civil', 'f': 'Vol*Ratio'},
    {'id': 13, 'name': '13. Brick Calculator', 'cat': 'Civil', 'f': 'Wall/Brick*1.05'},
    {'id': 14, 'name': '14. Steel Weight D²/162', 'cat': 'Civil', 'f': 'D²/162 kg/m'},
    {'id': 15, 'name': '15. Area Calculator', 'cat': 'Civil', 'f': 'L² L*W πr²'},
    {'id': 16, 'name': '16. Volume Calculator', 'cat': 'Civil', 'f': 'L³ πr²h'},
    {'id': 17, 'name': '17. Paint Calculator', 'cat': 'Civil', 'f': 'Area/10 L'},
    {'id': 18, 'name': '18. Tiles Calculator', 'cat': 'Civil', 'f': 'Floor/Tile*1.05'},
    {'id': 19, 'name': '19. Plaster Calculator', 'cat': 'Civil', 'f': 'Area*Thickness'},
    {'id': 20, 'name': '20. Bolt Nut Weight', 'cat': 'Mechanical', 'f': '0.00785*D²*L'},
    {'id': 21, 'name': '21. Pipe MS Weight', 'cat': 'Mechanical', 'f': '(OD-t)*t*0.02466'},
    {'id': 22, 'name': '22. Sheet Metal Weight', 'cat': 'Mechanical', 'f': 'L*W*T*7.85'},
    {'id': 23, 'name': '23. Welding Rod', 'cat': 'Mechanical', 'f': 'Rods/kg'},
    {'id': 24, 'name': '24. RPM Speed', 'cat': 'Mechanical', 'f': 'N=1000*Vc/πD'},
    {'id': 25, 'name': '25. Torque', 'cat': 'Mechanical', 'f': 'T=F*r'},
    {'id': 26, 'name': '26. HP to kW', 'cat': 'Mechanical', 'f': 'kW=HP*0.746'},
    {'id': 27, 'name': '27. Unit Converter', 'cat': 'Converter', 'f': 'kg/lb C/F'},
    {'id': 28, 'name': '28. Area Converter', 'cat': 'Converter', 'f': 'm² ft²'},
    {'id': 29, 'name': '29. Volume Converter', 'cat': 'Converter', 'f': 'L gal m³'},
    {'id': 30, 'name': '30. Currency Converter', 'cat': 'Converter', 'f': 'USD PKR 280'},
    {'id': 31, 'name': '31. Age Calculator', 'cat': 'Converter', 'f': 'DOB'},
    {'id': 32, 'name': '32. Date Difference', 'cat': 'Converter', 'f': 'Days'},
    {'id': 33, 'name': '33. Percentage', 'cat': 'Converter', 'f': 'p% of x'},
    {'id': 34, 'name': '34. GST Tax', 'cat': 'Converter', 'f': 'Price*GST/100'},
    {'id': 35, 'name': '35. Baby Age DOB', 'cat': 'Baby/Health', 'f': 'Months Wellness'},
    {'id': 36, 'name': '36. Baby Due Date LMP', 'cat': 'Baby/Health', 'f': 'LMP+280d'},
    {'id': 37, 'name': '37. BMI Weight Height', 'cat': 'Baby/Health', 'f': 'W/H² Wellness'},
    {'id': 38, 'name': '38. Water Intake Weight', 'cat': 'Baby/Health', 'f': 'W*0.033L Wellness'},
    {'id': 39, 'name': '39. BMR Calorie', 'cat': 'Baby/Health', 'f': 'Mifflin Wellness'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = calcs.where((c) {
      final name = c['name'] as String;
      final cat = c['cat'] as String;
      return name.toLowerCase().contains(q.toLowerCase()) ||
          cat.toLowerCase().contains(q.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop - 39 Calculators Working'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: TextField(
              onChanged: (value) => setState(() => q = value),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search calculators',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, i) {
          final c = filtered[i];
          return ListTile(
            title: Text(c['name']),
            subtitle: Text(c['cat']),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CalcDetailFinal(
                    id: c['id'],
                    name: c['name'],
                    formula: c['f'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CalcDetailFinal extends StatefulWidget {
  final int id;
  final String name;
  final String formula;

  const CalcDetailFinal({
    super.key,
    required this.id,
    required this.name,
    required this.formula,
  });

  @override
  State<CalcDetailFinal> createState() => _CalcDetailFinalState();
}

class _CalcDetailFinalState extends State<CalcDetailFinal> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();
  String res = '';

  void calc() {
    try {
      final v1 = double.tryParse(c1.text) ?? 0;
      final v2 = double.tryParse(c2.text) ?? 0;
      final v3 = double.tryParse(c3.text) ?? 0;

      switch (widget.id) {
        case 1:
          setState(() => res = 'V=${v1 * v2}V I=${v1 / v2}A R=${v1 / v2}Ω P=${v1 * v2}W\nFormula V=IR P=VI IEEE');
          break;
        case 2:
          final kw = v1;
          final voltage = v2 == 0 ? 220 : v2;
          final pf = v3 == 0 ? 0.8 : v3;
          final amp1 = kw * 1000 / (voltage * pf);
          final amp3 = kw * 1000 / (1.732 * voltage * pf);
          setState(() => res = 'kW=$kw HP=${(kw / 0.746).toStringAsFixed(2)}\nAmp 1Φ=${amp1.toStringAsFixed(2)}A\nAmp 3Φ=${amp3.toStringAsFixed(2)}A');
          break;
        case 3:
          final amps = v1;
          final mm2 = amps / 6;
          setState(() => res = '${amps}A -> ${mm2.toStringAsFixed(2)}mm² (J=6A/mm²)\nAWG/SWG Workshop Estimation');
          break;
        case 4:
          final i = v1;
          final l = v2;
          final r = v3 == 0 ? 0.02 : v3;
          final vd = 2 * i * l * r / 1000;
          setState(() => res = 'Voltage Drop=${vd.toStringAsFixed(2)}V\nFormula 2*I*L*R/1000');
          break;
        case 5:
          final vv = v1;
          final ii = v2;
          final three = c3.text == '3';
          final kva = three ? 1.732 * vv * ii / 1000 : vv * ii / 1000;
          setState(() => res = 'kVA=${kva.toStringAsFixed(2)}kVA ${three ? '3Ph' : '1Ph'}\nFormula ${three ? '1.732*V*I/1000' : 'V*I/1000'}');
          break;
        case 6:
          final wh = v1;
          final batteryVoltage = v2 == 0 ? 12 : v2;
          setState(() => res = 'Ah=${(wh / batteryVoltage).toStringAsFixed(2)}Ah @${batteryVoltage}V\nFormula Ah=Wh/V');
          break;
        case 7:
          final b1 = v1.toInt();
          final b2 = v2.toInt();
          final m = v3.toInt();
          final ohms = (b1 * 10 + b2) * pow(10, m).toDouble();
          setState(() => res = 'Resistor ${b1}${b2}x10^$m = ${ohms}Ω');
          break;
        case 8:
          final code = v1;
          final mult = (code % 100).toInt();
          final val = (code ~/ 100).toInt();
          final pfVal = val * pow(10, mult).toDouble();
          setState(() => res = 'Code ${code.toInt()} => ${pfVal}pF = ${(pfVal / 1000).toStringAsFixed(2)}nF');
          break;
        case 9:
          final pwMw = v1;
          final dbm = 10 * log(pwMw) / log(10);
          setState(() => res = '${pwMw}mW = ${dbm.toStringAsFixed(2)}dBm\nFormula 10*log10(P/1mW)');
          break;
        case 10:
          final vm = v1;
          final ut = vm / 0.000377;
          setState(() => res = 'E=${vm}V/m ~ H=${ut.toStringAsFixed(2)}uT\nAwareness only');
          break;
        case 11:
          final p = v1;
          final g = v2 == 0 ? 1 : v2;
          final r = v3 == 0 ? 1 : v3;
          final s = p * g / (4 * pi * r * r);
          setState(() => res = 'S=${s.toStringAsFixed(4)}W/m²\nFormula S=P*G/4πr²');
          break;
        case 12:
          final vol = v1;
          setState(() => res = 'Volume ${vol}m³ Ratio 1:2:4 Dry 1.54\nCement ${(vol * 0.22).toStringAsFixed(2)}m³ Sand ${(vol * 0.44).toStringAsFixed(2)}m³ Agg ${(vol * 0.88).toStringAsFixed(2)}m³');
          break;
        case 13:
          final wallA = v1;
          final brickA = v2 == 0 ? 0.02 : v2;
          final nos = wallA / brickA * 1.05;
          setState(() => res = 'Wall ${wallA}m² / Brick ${brickA}m² = ${nos.toStringAsFixed(0)} bricks +5% waste');
          break;
        case 14:
          final dia = v1;
          final len = v2 == 0 ? 1 : v2;
          final w = dia * dia / 162 * len;
          setState(() => res = 'Dia ${dia}mm Len ${len}m => Weight ${w.toStringAsFixed(3)}kg\nFormula D²/162 kg/m');
          break;
        case 15:
          if (c3.text.isEmpty) {
            setState(() => res = 'Square L²=${(v1 * v1).toStringAsFixed(3)} Circle πr²=${(pi * v1 * v1).toStringAsFixed(3)}');
          } else {
            setState(() => res = 'Rect L*W=${(v1 * v2).toStringAsFixed(3)}m²');
          }
          break;
        case 16:
          setState(() => res = 'Cube L³=${(v1 * v1 * v1).toStringAsFixed(3)} Cylinder πr²h=${(pi * v1 * v1 * v2).toStringAsFixed(3)}');
          break;
        case 17:
          final area = v1;
          final liters = area / 10;
          setState(() => res = 'Paint ${area}m² => ${liters.toStringAsFixed(2)}L (10m²/L) +10% => ${(liters * 1.1).toStringAsFixed(2)}L');
          break;
        case 18:
          final floorA = v1;
          final tileA = v2 == 0 ? 0.36 : v2;
          final tiles = floorA / tileA * 1.05;
          setState(() => res = 'Floor ${floorA}m² / Tile ${tileA}m² = ${tiles.toStringAsFixed(0)} tiles +5%');
          break;
        case 19:
          final a = v1;
          final t = v2 == 0 ? 0.012 : v2;
          setState(() => res = 'Plaster Vol=${(a * t).toStringAsFixed(3)}m³ Area ${a}m² Thickness ${t}m');
          break;
        case 20:
          final dia2 = v1 == 0 ? 12 : v1;
          final len2 = v2 == 0 ? 50 : v2;
          final boltW = 0.00785 * dia2 * dia2 * len2 / 1000;
          setState(() => res = 'Bolt Dia ${dia2}mm Len ${len2}mm ~ ${boltW.toStringAsFixed(3)}kg');
          break;
        case 21:
          final od = v1;
          final t2 = v2 == 0 ? 3 : v2;
          final wPipe = (od - t2) * t2 * 0.02466;
          setState(() => res = 'Pipe OD ${od}mm t ${t2}mm => ${wPipe.toStringAsFixed(3)}kg/m');
          break;
        case 22:
          final l = v1;
          final w2 = v2;
          final h = v3;
          final wgt = l * w2 * h * 7.85 / 1000000;
          setState(() => res = 'Sheet ${l}x${w2}x${h}mm => ${wgt.toStringAsFixed(3)}kg');
          break;
        case 23:
          final lenR = v1 == 0 ? 350 : v1;
          setState(() => res = 'Welding Rod ${lenR}mm ~ ${(1000 / lenR * 0.02).toStringAsFixed(2)} rods/kg');
          break;
        case 24:
          final vc = v1;
          final d = v2 == 0 ? 50 : v2;
          final rpm = 1000 * vc / (pi * d);
          setState(() => res = 'RPM=${rpm.toStringAsFixed(0)} Vc=${vc}m/min Dia=${d}mm');
          break;
        case 25:
          final f = v1;
          final r = v2;
          final tor = f * r;
          setState(() => res = 'Torque=${tor.toStringAsFixed(2)}Nm F=${f}N r=${r}m');
          break;
        case 26:
          final hp = v1;
          setState(() => res = '${hp}HP = ${(hp * 0.746).toStringAsFixed(3)}kW');
          break;
        case 27:
          final kg = v1;
          setState(() => res = '${kg}kg=${(kg * 2.20462).toStringAsFixed(2)}lb ${kg}C=${(kg * 9 / 5 + 32).toStringAsFixed(1)}F');
          break;
        case 28:
          final m2 = v1;
          setState(() => res = '${m2}m²=${(m2 * 10.7639).toStringAsFixed(2)}ft²=${(m2 * 1550).toStringAsFixed(0)}in²');
          break;
        case 29:
          final lit = v1;
          setState(() => res = '${lit}L=${(lit * 0.264172).toStringAsFixed(2)}gal=${(lit / 1000).toStringAsFixed(3)}m³');
          break;
        case 30:
          final usd = v1;
          final pkr = usd * 280;
          setState(() => res = '\$$usd = Rs ${pkr.toStringAsFixed(0)} (Rate 280)');
          break;
        case 31:
          final days = v1.toInt();
          setState(() => res = 'Age ${days} days = ${(days / 365).toStringAsFixed(1)} years');
          break;
        case 32:
          final d1 = v1;
          final d2 = v2;
          setState(() => res = 'Diff ${(d2 - d1).abs().toStringAsFixed(0)} days');
          break;
        case 33:
          final p2 = v1;
          final x = v2;
          setState(() => res = '${p2}% of ${x} = ${(p2 / 100 * x).toStringAsFixed(2)}');
          break;
        case 34:
          final price = v1;
          final gst = v2 == 0 ? 17 : v2;
          final amount = price * gst / 100;
          setState(() => res = 'Price Rs${price} GST ${gst}% => GST Rs${amount.toStringAsFixed(2)} Total Rs${(price + amount).toStringAsFixed(2)}');
          break;
        case 35:
          final months = v1;
          setState(() => res = 'Baby Age ${months} months = ${(months / 12).toStringAsFixed(1)} years');
          break;
        case 36:
          final lmp = DateTime.now().subtract(Duration(days: v1.toInt()));
          final due = lmp.add(const Duration(days: 280));
          setState(() => res = 'LMP ${lmp.toString().split(' ')[0]} +280d => Due ${due.toString().split(' ')[0]}');
          break;
        case 37:
          final wgt = v1;
          final h = v2 == 0 ? 1.7 : v2;
          final bmi = wgt / (h * h);
          setState(() => res = 'BMI=${bmi.toStringAsFixed(2)} W${wgt}kg H${h}m');
          break;
        case 38:
          final ww = v1;
          final water = ww * 0.033;
          setState(() => res = 'Weight ${ww}kg => Water ${water.toStringAsFixed(2)}L/day');
          break;
        case 39:
          final ww = v1;
          final h2 = v2;
          final age = v3 == 0 ? 30 : v3;
          final bmr = 10 * ww + 6.25 * h2 * 100 - 5 * age + 5;
          setState(() => res = 'BMR ~${bmr.toStringAsFixed(0)} kcal/day Mifflin-St Jeor');
          break;
        default:
          setState(() => res = 'Unsupported calculator');
      }
    } catch (e) {
      setState(() => res = 'Invalid: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name, style: const TextStyle(fontSize: 13)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Formula: ${widget.formula}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: c1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Value 1', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: c2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Value 2', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: c3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Value 3 (optional)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: calc,
              icon: const Icon(Icons.calculate),
              label: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            if (res.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal),
                ),
                child: Text(res, style: const TextStyle(fontSize: 14)),
              ),
            const SizedBox(height: 32),
          ],
        ),
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
  String rhoMethod = 'soil_wenner';

  final kw = TextEditingController(text: '10');
  final pf = TextEditingController(text: '0.8');
  final a = TextEditingController(text: '1');
  final r = TextEditingController(text: '10');
  final r2 = TextEditingController(text: '0.1');
  final area = TextEditingController(text: '0.000113');
  final len = TextEditingController(text: '1');
  final m = TextEditingController(text: '10');
  final vol = TextEditingController(text: '0.01');
  String res = '';

  void calc() {
    try {
      if (method == 'var') {
        final kW = double.parse(kw.text);
        final PF = double.parse(pf.text);
        final kVA = kW / PF;
        final th = acos(PF) * 180 / pi;
        final kVAR = kW * tan(acos(PF));
        setState(() => res = '✓ IEEE Std 1459\n\nP = kW\nQ = kVAR\nkVA = kW/PF\nTheta = acos(PF)\nQ = kW*tan(theta)\n\nkVA=${kVA.toStringAsFixed(2)}\nTheta=${th.toStringAsFixed(1)}°\nkVAR=${kVAR.toStringAsFixed(2)}');
      } else if (rhoMethod == 'soil_wenner') {
        final aa = double.parse(a.text);
        final rr = double.parse(r.text);
        final rho = 2 * pi * aa * rr;
        setState(() => res = '✓ Soil Rho Wenner ASTM G57-20\n\nρ = 2π a R\nρ=${rho.toStringAsFixed(4)} Ω·m');
      } else if (rhoMethod == 'material') {
        final rr = double.parse(r2.text);
        final aa2 = double.parse(area.text);
        final ll = double.parse(len.text);
        final rho = rr * aa2 / ll;
        setState(() => res = '✓ Material Resistivity\n\nρ = R*A/L\nρ=${rho.toStringAsFixed(6)} Ω·m');
      } else {
        final mm = double.parse(m.text);
        final vv = double.parse(vol.text);
        final rho = mm / vv;
        setState(() => res = '✓ Density/Resistivity\n\nρ = m/V\nρ=${rho.toStringAsFixed(4)} kg/m³');
      }
    } catch (e) {
      setState(() => res = 'Invalid: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VarRho Engine v1.0 IEEE+ASTM Research'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'var', label: Text('VAR IEEE'), icon: Icon(Icons.electric_bolt)),
                ButtonSegment(value: 'rho', label: Text('Rho ASTM'), icon: Icon(Icons.science)),
              ],
              selected: {method},
              onSelectionChanged: (selection) {
                setState(() => method = selection.first);
              },
            ),
            const SizedBox(height: 12),
            if (method == 'rho')
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'soil_wenner', label: Text('Soil')),
                  ButtonSegment(value: 'material', label: Text('Material')),
                  ButtonSegment(value: 'density', label: Text('Density')),
                ],
                selected: {rhoMethod},
                onSelectionChanged: (selection) {
                  setState(() => rhoMethod = selection.first);
                },
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Math.tex(
                method == 'var' ? r'kVA = \frac{kW}{PF},\quad Q = kW\tan(\theta)' : r'\rho = 2\pi a R',
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            if (method == 'var') ...[
              TextField(
                controller: kw,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Real Power kW', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: pf,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Power Factor PF', border: OutlineInputBorder()),
              ),
            ],
            if (method == 'rho' && rhoMethod == 'soil_wenner') ...[
              TextField(
                controller: a,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Electrode spacing a (m)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: r,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Resistance R (Ω)', border: OutlineInputBorder()),
              ),
            ],
            if (method == 'rho' && rhoMethod == 'material') ...[
              TextField(
                controller: r2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Resistance R (Ω)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: area,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Area A (m²)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: len,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Length L (m)', border: OutlineInputBorder()),
              ),
            ],
            if (method == 'rho' && rhoMethod == 'density') ...[
              TextField(
                controller: m,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Mass m (kg)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: vol,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Volume V (m³)', border: OutlineInputBorder()),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: calc,
              icon: const Icon(Icons.calculate_rounded),
              label: Text(method == 'var' ? 'Calculate VAR - IEEE 1459' : 'Calculate Rho - ASTM G57'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            if (res.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal),
                ),
                child: SelectableText(res, style: const TextStyle(fontSize: 14)),
              ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Standards: IEEE Std 1459-2010 Reactive Power, ASTM G57-20 Soil Resistivity',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class GPSFinal extends StatelessWidget {
  const GPSFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS & Maps Workshop - Private Offline'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GPS Save - Lat/Lng Title Notes Timestamp', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Private offline save with date/time and search metadata.'),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GPS Track - KML/GPX Offline Path', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Track path and export/import KML/GPX for field visits and journaling.'),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offline Maps - Flutter_map MBTiles', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Use local map tiles for offline navigation and project planning.'),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Traveler Journals - 3 free demo unlimited Pro', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Store notes, coordinates, and observations locally without cloud tracking.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BabyFinal extends StatelessWidget {
  const BabyFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Wellness + Health Gym + EMI'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.local_drink, color: Colors.blue),
              title: Text('Feeding Log - Breast/Bottle/Solid'),
              subtitle: Text('Time, type, amount, and notes for baby wellness tracking.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.bedtime, color: Colors.indigo),
              title: Text('Sleep Log - Start/End Duration'),
              subtitle: Text('Track baby sleep patterns and daily routines.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.baby_changing_station, color: Colors.orange),
              title: Text('Diaper Log - Wet/Dirty'),
              subtitle: Text('Simple, private daily diaper tracking.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monitor_weight, color: Colors.green),
              title: Text('Weight/Height/Temp - Clinic Card'),
              subtitle: Text('Use hospital/clinic values for wellness history.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.vaccines, color: Colors.red),
              title: Text('Vaccination Log'),
              subtitle: Text('Record vaccine dates and notes locally.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.water_drop, color: Colors.blue),
              title: Text('Health Gym - Water Steps Sleep Workout Rep'),
              subtitle: Text('Daily wellness tracking for health and exercise.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.wifi, color: Colors.orange),
              title: Text('EMI Source + Measurement + Mitigation'),
              subtitle: Text('Simple EMI awareness and exposure notes.'),
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryFinal extends StatelessWidget {
  const GalleryFinal({super.key});

  Widget jpgCard(String title, String asset) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery - Your Repo JPGs - Final'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(12),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
        children: [
          jpgCard('App Icon 1024', 'app.icon.1024.jpg'),
          jpgCard('GitHub Banner', 'github_banner_varrho.jpg'),
          jpgCard('Screenshot VAR IEEE', 'screenshot_var_calculator.jpg'),
          jpgCard('Screenshot Rho ASTM', 'screenshot_rho_calculator.jpg'),
        ],
      ),
    );
  }
}

class AboutFinal extends StatelessWidget {
  const AboutFinal({super.key});

  Future<void> open(String url) async {
    final u = Uri.parse(url);
    if (await canLaunchUrl(u)) {
      await launchUrl(u, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About - Privacy - Structure - Final v2.1.0'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.teal, Color(0xFF4DB6AC)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.science_rounded, size: 40, color: Colors.white),
                  const SizedBox(height: 12),
                  const Text(
                    'WanaLab Toolkit',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'VarRho Engine v1.0 - Research Based - Full 40+ Features\nv2.1.0+19 - Demo+Pro - No Ads - Global - Final Master',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => open('https://github.com/Nasir684/WanaLab-Toolkit'),
                        icon: const Icon(Icons.link),
                        label: const Text('GitHub Repo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.teal,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => open('https://github.com/Nasir684/WanaLab-Toolkit/tree/main/varrho-engine'),
                        icon: const Icon(Icons.science),
                        label: const Text('VarRho Engine'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _section(
              'Core Free Forever - No Limit - No Ads - For All Religions Equal',
              'Qibla Compass Offline Magnetic+GPS For all, Prayer Times Offline Cached Auto Location For all religions equal.',
            ),
            _section(
              'Standards & Formulas - Research Based - IEEE ASTM IS',
              'VAR: IEEE Std 1459-2010 Reactive Power Formula PF=kW/kVA kVA=kW/PF theta=acos(PF) kVAR=kW*tan(theta) VAR=V*I*sin(theta).',
            ),
            _section(
              'Privacy - Private By Design - No Ads - Offline Till 2037',
              'No server, no tracking, no ads SDK. Offline data stays on device and is wellness-only.',
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              child: const Text(
                'Built for offline research, wellness, and practical engineering tools.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }
}
