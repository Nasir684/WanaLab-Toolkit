import 'package:flutter/material.dart';

import 'baby_screen.dart';
import 'core_screen.dart';
import 'emi_screen.dart';
import 'gps_screen.dart';
import 'gym_screen.dart';
import 'import_export_screen.dart';
import 'settings_screen.dart';
import 'varrho_screen.dart';
import 'workshop_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = <DashboardCardData>[
      DashboardCardData(
        icon: Icons.verified_rounded,
        title: 'CORE',
        subtitle: 'Qibla, tasbeeh, daily peace content',
        page: const CoreScreen(),
      ),
      DashboardCardData(
        icon: Icons.gps_fixed_rounded,
        title: 'GPS & MAPS',
        subtitle: 'Private saved locations and route notes',
        page: const GPSScreen(),
      ),
      DashboardCardData(
        icon: Icons.child_care_rounded,
        title: 'BABY WELLNESS',
        subtitle: 'Feeding, sleep, diaper, and milestones',
        page: const BabyScreen(),
      ),
      DashboardCardData(
        icon: Icons.wifi_rounded,
        title: 'EMI WELLNESS',
        subtitle: 'E-field and EMI awareness tools',
        page: const EMIScreen(),
      ),
      DashboardCardData(
        icon: Icons.fitness_center_rounded,
        title: 'HEALTH & GYM',
        subtitle: 'Water, steps, and fitness tracking',
        page: const GymScreen(),
      ),
      DashboardCardData(
        icon: Icons.calculate_rounded,
        title: 'WORKSHOP',
        subtitle: '40 calculators and search helpers',
        page: const WorkshopScreen(),
      ),
      DashboardCardData(
        icon: Icons.electric_bolt_rounded,
        title: 'VarRho ENGINE',
        subtitle: 'IEEE power and ASTM resistivity formulas',
        page: const VarRhoScreen(),
      ),
      DashboardCardData(
        icon: Icons.import_export_rounded,
        title: 'IMPORT / EXPORT',
        subtitle: 'JSON backup and restore support',
        page: const ImportExportScreen(),
      ),
      DashboardCardData(
        icon: Icons.settings_rounded,
        title: 'SETTINGS',
        subtitle: 'Offline mode and local preferences',
        page: const SettingsScreen(),
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
        itemCount: cards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = cards[index];
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
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
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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

class DashboardCardData {
  const DashboardCardData({
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
