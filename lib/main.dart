import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'var_rho_engine.dart';
import 'categories/student_lab.dart';
import 'categories/workshop_tool.dart';

void main() => runApp(MaterialApp(home: VarRhoHome(), debugShowCheckedModeBanner: false));

class VarRhoHome extends StatefulWidget { @override State<VarRhoHome> createState()=>_VarRhoHomeState(); }

class _VarRhoHomeState extends State<VarRhoHome> {
List<double> bufX=[], bufY=[];
double liveVar=0, liveRho=0;
String status="Clean — background";
Color statusColor=Colors.green;
List<Map<String,dynamic>> log=[];
int categoryIndex=0;

final List<Map<String,dynamic>> categories = [
  {"title":"Ghost Detector", "icon": Icons.nights_stay, "desc":"Spirit presence"},
  {"title":"Baby Pollution", "icon": Icons.child_care, "desc":"Baby room safe?"},
  {"title":"EMF Meter", "icon": Icons.wifi_tethering, "desc":"Workshop tool"},
  {"title":"Spirit Detector", "icon": Icons.remove_red_eye, "desc":"Energy field"},
  {"title":"Paranormal Radar", "icon": Icons.radar, "desc":"Paranormal scan"},
  {"title":"EM Pollution", "icon": Icons.warning_amber, "desc":"High radio-active"},
  {"title":"Bug Detector", "icon": Icons.videocam_off, "desc":"Hidden device finder"},
  {"title":"Sleep Safe", "icon": Icons.bedtime, "desc":"Bedroom radiation"},
  {"title":"Vastu / Geo", "icon": Icons.landscape, "desc":"Geopathic stress"},
  {"title":"Metal Detector", "icon": Icons.hardware, "desc":"Basic metal finder"},
  {"title":"Student Lab", "icon": Icons.science, "desc":"Var/Rho graph log"},
  {"title":"Router Leak", "icon": Icons.router, "desc":"WiFi/microwave leak"},
];

@override void initState(){
super.initState();
magnetometerEventStream(samplingPeriod: Duration(milliseconds: 20)).listen((e){
bufX.add(e.x); bufY.add(e.y);
if(bufX.length>=25){
final r = VarRhoEngine.analyze(bufX, bufY);
setState((){
liveVar = r['Var']; liveRho = r['Rho'];
if(r['pass']){
  if(categoryIndex==0) status = "GHOST DETECTED: ${r['type']}";
  else if(categoryIndex==1) status = r['Var']>500 ? "BABY ROOM: HIGH POLLUTION!" : "BABY ROOM: Moderate Pollution";
  else if(categoryIndex==2) status = "EMF: ${r['Var'].toStringAsFixed(0)} µT - ${r['type']}";
  else if(categoryIndex==3) status = "SPIRIT ENERGY: ${r['type']}";
  else if(categoryIndex==4) status = "PARANORMAL ANOMALY: Rho ${r['Rho'].toStringAsFixed(2)}";
  else if(categoryIndex==5) status = "EM POLLUTION ALERT: High Radio Active - Var ${r['Var'].toStringAsFixed(0)}";
  else if(categoryIndex==6) status = r['Rho'].abs()>0.8 ? "HIDDEN DEVICE SUSPECTED!" : "Scanning... possible device";
  else if(categoryIndex==7) status = r['Var']>200 ? "BEDROOM: Not safe for sleep" : "BEDROOM: Safe";
  else if(categoryIndex==8) status = r['Var']>300 ? "GEOPATHIC STRESS DETECTED" : "Vastu: Clean zone";
  else if(categoryIndex==9) status = r['Var']>400 ? "METAL NEARBY!" : "No metal";
  else if(categoryIndex==10) status = "LAB: Var ${r['Var'].toStringAsFixed(1)} Rho ${r['Rho'].toStringAsFixed(2)}";
  else status = "ROUTER LEAK: High EMI near device";
  statusColor = categoryIndex==1 ? (r['Var']>500 ? Colors.red : Colors.orange) : (r['type'].toString().contains('global') ? Colors.red : Colors.orange);
  log.insert(0, {'time': DateTime.now().toString().substring(11,19), 'mode': categories[categoryIndex]['title'], ...r});
  if(log.length>50) log.removeLast();
} else {
  status = categoryIndex==1 ? "Baby Room: SAFE — Var ${liveVar.toStringAsFixed(0)}" : "Clean — Var ${liveVar.toStringAsFixed(0)}";
  statusColor = Colors.green;
}
});
bufX.clear(); bufY.clear();
}
});
}

Widget getScreen(){
if(categoryIndex==1 || categoryIndex==2 || categoryIndex==10) {
  return StudentLabScreen(liveLog: log);
}
return WorkshopToolScreen(mode: categories[categoryIndex]['title']);
}

@override Widget build(BuildContext ctx){
var cat = categories[categoryIndex];
return Scaffold(
appBar: AppBar(title: Text("WanaLab Toolkit - ${cat['title']}"), backgroundColor: Colors.black87),
body: Column(children: [
Container(color: statusColor, width: double.infinity, padding: EdgeInsets.all(10), child: Row(children:[Icon(cat['icon'], color: Colors.white, size: 18), SizedBox(width:8), Expanded(child: Text(status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)))])),
Container(height: 75, child: ListView(scrollDirection: Axis.horizontal, children: categories.asMap().entries.map((entry){
  int idx = entry.key; var c = entry.value;
  return Padding(padding: EdgeInsets.all(4), child: ChoiceChip(
    avatar: Icon(c['icon'], size: 16),
    label: Text(c['title'], style: TextStyle(fontSize: 11)),
    selected: categoryIndex==idx,
    onSelected: (_)=>setState(()=>categoryIndex=idx)
  ));
}).toList())),
Expanded(child: getScreen()),
Padding(padding: EdgeInsets.all(4), child: Text("WanaLab | Mode ${categoryIndex+1}/12: ${cat['desc']} | Var: ${liveVar.toStringAsFixed(1)} Rho: ${liveRho.toStringAsFixed(2)}", style: TextStyle(fontSize: 9, color: Colors.grey))),
]),
);
}
}
