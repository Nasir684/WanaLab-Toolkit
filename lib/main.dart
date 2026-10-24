import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Init Storage first - fast
  await StorageService.init();

  // 2. Init Ads - with safety for slow Wana internet
  try {
    await MobileAds.instance.initialize();
    debugPrint("Ads initialized");
  } catch (e) {
    debugPrint("Ads init failed - will retry later: $e");
  }

  runApp(const WanaLabApp());
}
