import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final String githubUrl = "https://github.com/Nasir684/WanaLab-Toolkit";
  final String varRhoUrl = "https://github.com/Nasir684/WanaLab-Toolkit/tree/main/varrho-engine";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About - WanaLab Toolkit")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Column(children: [
              Image.asset("assets/icons/defaultFlavor_icon.png", height: 90),
              SizedBox(height:12),
              Text("WanaLab Toolkit", style: TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
              Text("Necessary toolkit in every mobile", style: TextStyle(fontSize:14, color: Colors.grey[700])),
              SizedBox(height:6),
              Container(padding: EdgeInsets.symmetric(horizontal:12, vertical:6), decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20)), child: Text("Powered by VarRho Engine • Research Based", style: TextStyle(fontSize:11, fontWeight: FontWeight.bold, color: Colors.blue[800]))),
              SizedBox(height:8),
              InkWell(onTap: () async { final url = Uri.parse(githubUrl); if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication); }, child: Container(padding: EdgeInsets.symmetric(horizontal:14, vertical:8), decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(8)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.code, size:16), SizedBox(width:6), Flexible(child: Text(githubUrl, style: TextStyle(fontSize:11, color: Colors.blue, decoration: TextDecoration.underline)))]))),
              SizedBox(height:6),
              Text("For All Religions • Equal • Private • No Ads Ever • Offline Until 2037 • Global", style: TextStyle(fontSize:10, color: Colors.grey), textAlign: TextAlign.center),
            ])),
            Divider(height:32),
            
            _sectionTitle("VarRho Engine - Research Based - Accurate - GitHub"),
            _bullet("Engine: WanaLab Toolkit is based on VarRho Engine - Part of our research at GitHub - $githubUrl - VarRho Engine calculates VAR - Reactive Power and Rho - Resistivity / Density accurately - Research based"),
            _bullet("GitHub Repo: $githubUrl - Main research repository - Contains VarRho Engine core, 40 calculators formulas, validation tables, accuracy tests - Open for review - For students, engineers, universities - Transparent"),
            _bullet("VAR - Reactive Power: Formula VAR = V * I * sin(θ) and kVAR = kW * tan(acos(PF)) and kVA = kW / PF - Accurate for electrical workshop - Power factor correction - Based on IEEE standard - Research verified - See GitHub repo /varrho-engine folder"),
            _bullet("Rho - Resistivity: 3 Methods - Material Resistivity Rho = R * A / L, Soil Resistivity Wenner Method Rho = 2 * π * a * R (ASTM G57), Density Rho = m / V - Accurate for civil/electrical workshop - Soil testing - Material testing - Based on ASTM G57 Wenner standard + Physics formulas - Research verified - GitHub"),
            _bullet("Accuracy: VarRho Engine uses double precision - Validated with standard tables - Steel weight kg/m = dia^2/162 IS standard, Concrete ratio IS 456, Wire gauge AWG - All formulas from IS, ASTM, IEEE standards - Cross-checked - Research at GitHub $githubUrl - Open for review - Not black box"),
            _bullet("40 Calculators Powered by VarRho: All 40 calculators use VarRho Engine core for accurate results - Shows formula - User can verify formula from GitHub repo - Transparent - For workshop, household, university, research"),

            _sectionTitle("Author - Nasir Khan"),
            _bullet("Author: Nasir Khan - Researcher - Developer - Based in Wana, South Waziristan - Founder of WanaLab Toolkit and VarRho Engine - GitHub: https://github.com/Nasir684 - Passion for accurate tools for local community and global users"),
            _bullet("Research Focus: VarRho Engine - VAR and Rho calculations for electrical and civil workshops - Soil resistivity - Power systems - Material density - For students, electricians, civil engineers, workshop owners in Wana and beyond - Research available at $githubUrl"),
            _bullet("Mission: Provide necessary toolkit in every mobile - Accurate - Private - No Ads - For All Religions Equal - Made in Wana for Global - Empower local workshops, students, households with accurate calculations - Based on research not guesses - Open research at GitHub"),
            _bullet("GitHub: $githubUrl - Research repo with VarRho Engine formulas, validation, source structure, accuracy tests - For feedback, contributions, research collaboration - Open for students and engineers - WanaLab Toolkit - Made in Wana - Author Nasir Khan"),
            _bullet("Philosophy: Accurate tools should be private, offline, no ads, for all - Research based not marketing - VarRho Engine ensures accuracy - User can verify formulas from GitHub repo - Open for review - For education and empowerment - Made in Wana for Global Community"),

            _sectionTitle("App Info - WanaLab Toolkit - VarRho Engine"),
            _bullet("App Name: WanaLab Toolkit"),
            _bullet("Version: 1.7.2+48 - Build v1.7.2+48 - Demo+Pro - Powered by VarRho Engine - GitHub: $githubUrl"),
            _bullet("Tagline: Necessary toolkit in every mobile • Powered by VarRho Engine • Research at GitHub • For All Religions • Equal • Private • No Ads Ever"),
            _bullet("Flavors: 10 Flavors - Default, University, Airline, Government, Health, Gym, Clinic, Baby Health, Maternal, EMI - Same VarRho Engine core from GitHub - Different config"),
            _bullet("No Ads Ever: No AdMob - No ads SDK - No tracking SDK - Clean - Private by design - Research focus not ads"),
            _bullet("Offline: Works offline until 2037 - VarRho Engine offline - No internet needed - GitHub repo for online review but app works offline"),
            _bullet("Private: Data stays on device - Hive boxes - No server - No upload - Export only if user wants - Delete anytime - Research data private"),

            _sectionTitle("Workshop - 40 Calculators - Powered by VarRho Engine"),
            _bullet("GitHub Source: All calculator formulas available at $githubUrl - Folder /lib/calculators and /varrho-engine - Open for review - Accurate - Research based"),
            _bullet("Electrical: 13 - Ohm's Law, Power kW/HP, Wire Gauge AWG/SWG, Cable Size/Voltage Drop, Transformer kVA, Battery Ah, Resistor Color, Capacitor Code, dBm/dB, EMI Field V/m to uT Awareness only, RF Power Density Awareness only, VAR Calculator Reactive Power kVAR/kVA Accurate VarRho Engine, Rho Calculator Resistivity Ohm.m Soil Wenner + Density Accurate VarRho Engine - NEW - See GitHub"),
            _bullet("Civil: 8 - Concrete 1:2:4, Brick, Steel Weight Rod Dia to kg/m Accurate VarRho, Area, Volume, Paint, Tiles, Plaster - All formulas IS/ASTM verified - VarRho Engine - GitHub"),
            _bullet("Mechanical: 7 - Bolt/Nut Weight, Pipe Weight MS, Sheet Metal Weight, Welding Rod, RPM/Speed, Torque, HP to kW - VarRho Engine Accurate - GitHub"),
            _bullet("Converters: 8 - Unit Converter, Area Converter, Volume, Currency Offline Rate, Age, Date Difference, Percentage, GST/Tax - VarRho Engine - GitHub"),
            _bullet("Baby/Health: 4 - Baby Age Wellness only, Due Date LMP Wellness only Not medical, BMI Wellness only Not medical, Water Intake + BMR/Calorie Wellness only - VarRho Engine Wellness only - GitHub"),
            _bullet("Total: 40 Calculators - All powered by VarRho Engine - Accurate - Research based - GitHub $githubUrl - All in all flavors - Demo+Pro"),
            _bullet("5 Tools: Import File + WhatsApp + Manual Type + Paste CSV/JSON For Students, Export PDF/CSV/JSON/KML/GPX + Share WhatsApp, Analysis, Graph, Notepad - Offline - Private - No Ads - VarRho Engine accurate - GitHub"),

            _sectionTitle("Build - Powered by VarRho Engine - GitHub Research"),
            _bullet("Version: 1.7.2+48 - Build Name 1.7.2 Build Number 48 - 10 Flavors - VarRho Engine v1.0 - GitHub $githubUrl"),
            _bullet("Engine: VarRho Engine - VAR + Rho calculations - Research based - Accurate - GitHub: $varRhoUrl - Double precision - IEEE/ASTM/IS standards - Validated - Open"),
            _bullet("Author: Nasir Khan - GitHub https://github.com/Nasir684 - WanaLab Toolkit - $githubUrl - Made in Wana, South Waziristan"),
            _bullet("Packages: in_app_purchase, shared_preferences, flutter_map, hive, hive_flutter, fl_chart, file_picker, csv, pdf, share_plus, path_provider, package_info_plus, url_launcher - NO AdMob - NO ads SDK - Clean"),
            _bullet("Build Commands: flutter build appbundle --flavor defaultFlavor -t lib/flavors/main_default.dart --build-name=1.7.2 --build-number=48"),

            SizedBox(height:24),
            Center(child: Column(children: [
              Text("WanaLab Toolkit", style: TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
              SizedBox(height:4),
              Text("Powered by VarRho Engine", style: TextStyle(fontWeight: FontWeight.bold, fontSize:13, color: Colors.blue[800])),
              SizedBox(height:4),
              InkWell(onTap: () async { final url = Uri.parse(githubUrl); if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication); }, child: Text(githubUrl, style: TextStyle(fontSize:11, color: Colors.blue, decoration: TextDecoration.underline, fontWeight: FontWeight.bold))),
              SizedBox(height:8),
              Text("Author: Nasir Khan - Researcher - Wana, South Waziristan - Made in Wana for Global", style: TextStyle(fontSize:11, color: Colors.grey[700]), textAlign: TextAlign.center),
              SizedBox(height:4),
              Text("For All Religions Equal • Private • No Ads Ever • Offline Until 2037", style: TextStyle(fontSize:11, color: Colors.grey), textAlign: TextAlign.center),
              SizedBox(height:12),
              FutureBuilder<PackageInfo>(future: PackageInfo.fromPlatform(), builder: (c,s)=> Text(s.hasData ? "Version ${s.data!.version}+${s.data!.buildNumber} - VarRho Engine v1.0 - WanaLab Toolkit" : "Version 1.7.2+48 - VarRho Engine v1.0 - WanaLab Toolkit", style: TextStyle(fontSize:10, color: Colors.grey))),
              SizedBox(height:16),
              Text("Private by Design - No tracking - Data stays on device - Delete anytime - Wellness only - Not medical advice - Peace filter - For all religions equal - No Ads Ever - Powered by VarRho Engine - Research at GitHub - Author Nasir Khan - $githubUrl", style: TextStyle(fontSize:9, color: Colors.grey), textAlign: TextAlign.center),
            ])),
            SizedBox(height:32),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(padding: EdgeInsets.only(top:20, bottom:8), child: Text(title, style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, color: Colors.blue[800])));
  Widget _bullet(String text) => Padding(padding: EdgeInsets.only(bottom:6, left:8), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("• ", style: TextStyle(fontWeight: FontWeight.bold)), Expanded(child: Text(text, style: TextStyle(fontSize:12)))]));
}
