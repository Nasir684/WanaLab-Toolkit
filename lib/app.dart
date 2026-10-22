import 'package:flutter/material.dart';

import 'features/about_screen.dart';
import 'features/baby_screen.dart';
import 'features/core_screen.dart';
import 'features/dashboard_screen.dart';
import 'features/emi_screen.dart';
import 'features/gallery_screen.dart';
import 'features/gps_screen.dart';
import 'features/gym_screen.dart';
import 'features/import_export_screen.dart';
import 'features/settings_screen.dart';
import 'features/varrho_screen.dart';
import 'features/workshop_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF5F7F7),
        cardTheme: CardTheme(
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
  int selectedIndex = 0;

  static const List<Widget> pages = [
    DashboardScreen(),
    CoreScreen(),
    GPSScreen(),
    BabyScreen(),
    EMIScreen(),
    GymScreen(),
    WorkshopScreen(),
    VarRhoScreen(),
    ImportExportScreen(),
    SettingsScreen(),
    GalleryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
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
                gradient: LinearGradient(
                  colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.science_rounded, size: 38, color: Colors.white),
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
            _drawerButton(Icons.verified_rounded, 'Core', 1),
            _drawerButton(Icons.map, 'GPS & Maps', 2),
            _drawerButton(Icons.child_care_rounded, 'Baby Wellness', 3),
            _drawerButton(Icons.wifi_rounded, 'EMI Wellness', 4),
            _drawerButton(Icons.fitness_center_rounded, 'Health & Gym', 5),
            _drawerButton(Icons.calculate_rounded, 'Workshop', 6),
            _drawerButton(Icons.electric_bolt_rounded, 'VarRho Engine', 7),
            _drawerButton(Icons.import_export_rounded, 'Import / Export', 8),
            const Divider(),
            _drawerButton(Icons.settings_rounded, 'Settings', 9),
            _drawerButton(Icons.photo_library_rounded, 'Gallery', 10),
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
