import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const WanaLabApp());
}

class WanaLabApp extends StatelessWidget {
  const WanaLabApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanaLab Toolkit',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const VarRhoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VarRhoHome extends StatefulWidget {
  const VarRhoHome({super.key});
  @override
  State<VarRhoHome> createState() => _VarRhoHomeState();
}

class _VarRhoHomeState extends State<VarRhoHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController varController = TextEditingController();
  final TextEditingController rhoController = TextEditingController();
  String varResult = "";
  String rhoResult = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  double calcVar(List<double> values) {
    if (values.isEmpty) return 0;
    double mean = values.reduce((a,b)=>a+b)/values.length;
    double variance = values.map((e) => (e-mean)*(e-mean)).reduce((a,b)=>a+b)/values.length;
    return variance;
  }

  double calcRho(double density, double ref) {
    if (ref==0) return 0;
    return density / ref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WanaLab Toolkit - VarRho'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Var Calculator'), Tab(text: 'Rho Calculator')],
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Var Tab
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text('Enter values comma separated (e.g. 2,4,4,4,5,5,7,9)', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(controller: varController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '2,4,4,4,5,5,7,9')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: (){
                try{
                  List<double> vals = varController.text.split(',').map((e)=>double.parse(e.trim())).toList();
                  double v = calcVar(vals);
                  setState(()=> varResult = 'Variance: ${v.toStringAsFixed(4)}\nStdDev: ${ (v>0? (v).toString(): "0")}');
                }catch(e){ setState(()=> varResult = 'Invalid input');}
              }, child: const Text('Calculate Var')),
              const SizedBox(height: 20),
              Text(varResult, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
          ),
          // Rho Tab
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text('Rho = Density / Reference Density', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(controller: rhoController, keyboardType: TextInputType.number, decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Enter density value')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: (){
                try{
                  double d = double.parse(rhoController.text);
                  double rho = calcRho(d, 1.0); // ref =1 for now, loads from assets if available
                  setState(()=> rhoResult = 'Rho: ${rho.toStringAsFixed(4)}');
                }catch(e){ setState(()=> rhoResult = 'Invalid input');}
              }, child: const Text('Calculate Rho')),
              const SizedBox(height: 20),
              Text(rhoResult, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              const Text('WanaLab v2.1.0 - Build 19 - Clean Build', style: TextStyle(color: Colors.grey)),
            ]),
          ),
        ],
      ),
    );
  }
}
