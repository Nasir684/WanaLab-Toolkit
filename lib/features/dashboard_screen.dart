
import 'package:flutter/material.dart';
import 'compass_screen.dart';
import 'device_info_screen.dart';
import 'network_speed_screen.dart';
import 'dice_roller_screen.dart';
import 'notes_screen.dart';
import 'sensor_screen.dart';
import 'calculator_screen.dart';
import 'icon_pack_screen.dart';
import 'ram_info_screen.dart';
import 'ocr_screen.dart';
import 'video_player_screen.dart';
import 'qibla_finder_screen.dart';
import 'barcode_screen.dart';
import 'voice_recorder_screen.dart';
import 'bmi_screen.dart';
import 'sun_calculator_screen.dart';
import 'date_calculator_screen.dart';
import 'qr_scanner_screen.dart';
import 'gradient_maker_screen.dart';
import 'ruler_screen.dart';
import 'quote_day_screen.dart';
import 'image_editor_screen.dart';
import 'flashlight_screen.dart';
import 'hash_generator_screen.dart';
import 'audio_player_screen.dart';
import 'habit_tracker_screen.dart';
import 'http_tester_screen.dart';
import 'loan_calculator_screen.dart';
import 'barcode_scanner_screen.dart';
import 'pomodoro_screen.dart';
import 'password_generator_screen.dart';
import 'pdf_screen.dart';
import 'color_picker_screen.dart';
import 'step_counter_screen.dart';
import 'expense_tracker_screen.dart';
import 'dictionary_screen.dart';
import 'tip_calculator_screen.dart';
import 'battery_info_screen.dart';
import 'app_locker_screen.dart';
import 'moon_phase_screen.dart';
import 'port_scanner_screen.dart';
import 'pdf_scanner_screen.dart';
import 'qibla_screen.dart';
import 'mqtt_client_screen.dart';
import 'weather_screen.dart';
import 'sensor_test_screen.dart';
import 'xml_viewer_screen.dart';
import 'ble_screen.dart';
import 'ip_finder_screen.dart';
import 'wifi_screen.dart';
import 'core_screen.dart';
import 'binary_converter_screen.dart';
import 'protractor_screen.dart';
import 'battery_screen.dart';
import 'prayer_times_screen.dart';
import 'wifi_analyzer_screen.dart';
import 'mqtt_screen.dart';
import 'currency_screen.dart';
import 'map_screen.dart';
import 'vibration_screen.dart';
import 'zip_tool_screen.dart';
import 'notification_history_screen.dart';
import 'gps_tracker_screen.dart';
import 'storage_analyzer_screen.dart';
import 'nfc_screen.dart';
import 'json_formatter_screen.dart';
import 'backup_screen.dart';
import 'speedometer_screen.dart';
import 'cpu_info_screen.dart';
import 'altitude_screen.dart';
import 'prayer_screen.dart';
import 'qr_screen.dart';
import 'health_tracker_screen.dart';
import 'coordinates_screen.dart';
import 'file_manager_screen.dart';
import 'ir_remote_screen.dart';
import 'nfc_reader_screen.dart';
import 'user_agent_screen.dart';
import 'translator_screen.dart';
import 'coin_flip_screen.dart';
import 'wallpaper_screen.dart';
import 'theme_engine_screen.dart';
import 'permission_manager_screen.dart';
import 'ping_tool_screen.dart';
import 'brightness_screen.dart';
import 'whois_screen.dart';
import 'world_clock_screen.dart';
import 'alarm_screen.dart';
import 'morse_code_screen.dart';
import 'pdf_maker_screen.dart';
import 'gps_screen.dart';
import 'zip_screen.dart';
import 'qr_maker_screen.dart';
import 'water_reminder_screen.dart';
import 'random_number_screen.dart';
import 'dns_lookup_screen.dart';
import 'font_viewer_screen.dart';
import 'weight_screen.dart';
import 'ble_scanner_screen.dart';
import 'heart_rate_screen.dart';
import 'stopwatch_screen.dart';
import 'age_calculator_screen.dart';
import 'todo_screen.dart';
import 'bmi_calculator_screen.dart';
import 'ocr_text_screen.dart';
import 'usb_info_screen.dart';
import 'about_screen.dart';
import 'countdown_screen.dart';
import 'theme_screen.dart';
import 'level_tool_screen.dart';
import 'todo_list_screen.dart';
import 'timer_screen.dart';
import 'lottery_screen.dart';
import 'offline_map_screen.dart';
import 'magnetometer_screen.dart';
import 'backup_restore_screen.dart';
import 'unit_converter_screen.dart';
import 'length_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final tools = [
    {'slug':'about','title':'About','cls':'AboutScreen'},
    {'slug':'age_calculator','title':'Age Calculator','cls':'AgeCalculatorScreen'},
    {'slug':'alarm','title':'Alarm','cls':'AlarmScreen'},
    {'slug':'altitude','title':'Altitude','cls':'AltitudeScreen'},
    {'slug':'app_locker','title':'App Locker','cls':'AppLockerScreen'},
    {'slug':'audio_player','title':'Audio Player','cls':'AudioPlayerScreen'},
    {'slug':'backup_restore','title':'Backup Restore','cls':'BackupRestoreScreen'},
    {'slug':'backup','title':'Backup','cls':'BackupScreen'},
    {'slug':'barcode_scanner','title':'Barcode Scanner','cls':'BarcodeScannerScreen'},
    {'slug':'barcode','title':'Barcode','cls':'BarcodeScreen'},
    {'slug':'battery_info','title':'Battery Info','cls':'BatteryInfoScreen'},
    {'slug':'battery','title':'Battery','cls':'BatteryScreen'},
    {'slug':'binary_converter','title':'Binary Converter','cls':'BinaryConverterScreen'},
    {'slug':'ble_scanner','title':'Ble Scanner','cls':'BleScannerScreen'},
    {'slug':'ble','title':'Ble','cls':'BleScreen'},
    {'slug':'bmi_calculator','title':'Bmi Calculator','cls':'BmiCalculatorScreen'},
    {'slug':'bmi','title':'Bmi','cls':'BmiScreen'},
    {'slug':'brightness','title':'Brightness','cls':'BrightnessScreen'},
    {'slug':'calculator','title':'Calculator','cls':'CalculatorScreen'},
    {'slug':'coin_flip','title':'Coin Flip','cls':'CoinFlipScreen'},
    {'slug':'color_picker','title':'Color Picker','cls':'ColorPickerScreen'},
    {'slug':'compass','title':'Compass','cls':'CompassScreen'},
    {'slug':'coordinates','title':'Coordinates','cls':'CoordinatesScreen'},
    {'slug':'core','title':'Core','cls':'CoreScreen'},
    {'slug':'countdown','title':'Countdown','cls':'CountdownScreen'},
    {'slug':'cpu_info','title':'Cpu Info','cls':'CpuInfoScreen'},
    {'slug':'currency','title':'Currency','cls':'CurrencyScreen'},
    {'slug':'date_calculator','title':'Date Calculator','cls':'DateCalculatorScreen'},
    {'slug':'device_info','title':'Device Info','cls':'DeviceInfoScreen'},
    {'slug':'dice_roller','title':'Dice Roller','cls':'DiceRollerScreen'},
    {'slug':'dictionary','title':'Dictionary','cls':'DictionaryScreen'},
    {'slug':'dns_lookup','title':'Dns Lookup','cls':'DnsLookupScreen'},
    {'slug':'expense_tracker','title':'Expense Tracker','cls':'ExpenseTrackerScreen'},
    {'slug':'file_manager','title':'File Manager','cls':'FileManagerScreen'},
    {'slug':'flashlight','title':'Flashlight','cls':'FlashlightScreen'},
    {'slug':'font_viewer','title':'Font Viewer','cls':'FontViewerScreen'},
    {'slug':'gps','title':'Gps','cls':'GpsScreen'},
    {'slug':'gps_tracker','title':'Gps Tracker','cls':'GpsTrackerScreen'},
    {'slug':'gradient_maker','title':'Gradient Maker','cls':'GradientMakerScreen'},
    {'slug':'habit_tracker','title':'Habit Tracker','cls':'HabitTrackerScreen'},
    {'slug':'hash_generator','title':'Hash Generator','cls':'HashGeneratorScreen'},
    {'slug':'health_tracker','title':'Health Tracker','cls':'HealthTrackerScreen'},
    {'slug':'heart_rate','title':'Heart Rate','cls':'HeartRateScreen'},
    {'slug':'http_tester','title':'Http Tester','cls':'HttpTesterScreen'},
    {'slug':'icon_pack','title':'Icon Pack','cls':'IconPackScreen'},
    {'slug':'image_editor','title':'Image Editor','cls':'ImageEditorScreen'},
    {'slug':'ip_finder','title':'Ip Finder','cls':'IpFinderScreen'},
    {'slug':'ir_remote','title':'Ir Remote','cls':'IrRemoteScreen'},
    {'slug':'json_formatter','title':'Json Formatter','cls':'JsonFormatterScreen'},
    {'slug':'length','title':'Length','cls':'LengthScreen'},
    {'slug':'level_tool','title':'Level Tool','cls':'LevelToolScreen'},
    {'slug':'loan_calculator','title':'Loan Calculator','cls':'LoanCalculatorScreen'},
    {'slug':'lottery','title':'Lottery','cls':'LotteryScreen'},
    {'slug':'magnetometer','title':'Magnetometer','cls':'MagnetometerScreen'},
    {'slug':'map','title':'Map','cls':'MapScreen'},
    {'slug':'moon_phase','title':'Moon Phase','cls':'MoonPhaseScreen'},
    {'slug':'morse_code','title':'Morse Code','cls':'MorseCodeScreen'},
    {'slug':'mqtt_client','title':'Mqtt Client','cls':'MqttClientScreen'},
    {'slug':'mqtt','title':'Mqtt','cls':'MqttScreen'},
    {'slug':'network_speed','title':'Network Speed','cls':'NetworkSpeedScreen'},
    {'slug':'nfc_reader','title':'Nfc Reader','cls':'NfcReaderScreen'},
    {'slug':'nfc','title':'Nfc','cls':'NfcScreen'},
    {'slug':'notes','title':'Notes','cls':'NotesScreen'},
    {'slug':'notification_history','title':'Notification History','cls':'NotificationHistoryScreen'},
    {'slug':'ocr','title':'Ocr','cls':'OcrScreen'},
    {'slug':'ocr_text','title':'Ocr Text','cls':'OcrTextScreen'},
    {'slug':'offline_map','title':'Offline Map','cls':'OfflineMapScreen'},
    {'slug':'password_generator','title':'Password Generator','cls':'PasswordGeneratorScreen'},
    {'slug':'pdf_maker','title':'Pdf Maker','cls':'PdfMakerScreen'},
    {'slug':'pdf_scanner','title':'Pdf Scanner','cls':'PdfScannerScreen'},
    {'slug':'pdf','title':'Pdf','cls':'PdfScreen'},
    {'slug':'permission_manager','title':'Permission Manager','cls':'PermissionManagerScreen'},
    {'slug':'ping_tool','title':'Ping Tool','cls':'PingToolScreen'},
    {'slug':'pomodoro','title':'Pomodoro','cls':'PomodoroScreen'},
    {'slug':'port_scanner','title':'Port Scanner','cls':'PortScannerScreen'},
    {'slug':'prayer','title':'Prayer','cls':'PrayerScreen'},
    {'slug':'prayer_times','title':'Prayer Times','cls':'PrayerTimesScreen'},
    {'slug':'protractor','title':'Protractor','cls':'ProtractorScreen'},
    {'slug':'qibla_finder','title':'Qibla Finder','cls':'QiblaFinderScreen'},
    {'slug':'qibla','title':'Qibla','cls':'QiblaScreen'},
    {'slug':'qr_maker','title':'Qr Maker','cls':'QrMakerScreen'},
    {'slug':'qr_scanner','title':'Qr Scanner','cls':'QrScannerScreen'},
    {'slug':'qr','title':'Qr','cls':'QrScreen'},
    {'slug':'quote_day','title':'Quote Day','cls':'QuoteDayScreen'},
    {'slug':'ram_info','title':'Ram Info','cls':'RamInfoScreen'},
    {'slug':'random_number','title':'Random Number','cls':'RandomNumberScreen'},
    {'slug':'ruler','title':'Ruler','cls':'RulerScreen'},
    {'slug':'sensor','title':'Sensor','cls':'SensorScreen'},
    {'slug':'sensor_test','title':'Sensor Test','cls':'SensorTestScreen'},
    {'slug':'speedometer','title':'Speedometer','cls':'SpeedometerScreen'},
    {'slug':'step_counter','title':'Step Counter','cls':'StepCounterScreen'},
    {'slug':'stopwatch','title':'Stopwatch','cls':'StopwatchScreen'},
    {'slug':'storage_analyzer','title':'Storage Analyzer','cls':'StorageAnalyzerScreen'},
    {'slug':'sun_calculator','title':'Sun Calculator','cls':'SunCalculatorScreen'},
    {'slug':'theme_engine','title':'Theme Engine','cls':'ThemeEngineScreen'},
    {'slug':'theme','title':'Theme','cls':'ThemeScreen'},
    {'slug':'timer','title':'Timer','cls':'TimerScreen'},
    {'slug':'tip_calculator','title':'Tip Calculator','cls':'TipCalculatorScreen'},
    {'slug':'todo_list','title':'Todo List','cls':'TodoListScreen'},
    {'slug':'todo','title':'Todo','cls':'TodoScreen'},
    {'slug':'translator','title':'Translator','cls':'TranslatorScreen'},
    {'slug':'unit_converter','title':'Unit Converter','cls':'UnitConverterScreen'},
    {'slug':'usb_info','title':'Usb Info','cls':'UsbInfoScreen'},
    {'slug':'user_agent','title':'User Agent','cls':'UserAgentScreen'},
    {'slug':'vibration','title':'Vibration','cls':'VibrationScreen'},
    {'slug':'video_player','title':'Video Player','cls':'VideoPlayerScreen'},
    {'slug':'voice_recorder','title':'Voice Recorder','cls':'VoiceRecorderScreen'},
    {'slug':'wallpaper','title':'Wallpaper','cls':'WallpaperScreen'},
    {'slug':'water_reminder','title':'Water Reminder','cls':'WaterReminderScreen'},
    {'slug':'weather','title':'Weather','cls':'WeatherScreen'},
    {'slug':'weight','title':'Weight','cls':'WeightScreen'},
    {'slug':'whois','title':'Whois','cls':'WhoisScreen'},
    {'slug':'wifi_analyzer','title':'Wifi Analyzer','cls':'WifiAnalyzerScreen'},
    {'slug':'wifi','title':'Wifi','cls':'WifiScreen'},
    {'slug':'world_clock','title':'World Clock','cls':'WorldClockScreen'},
    {'slug':'xml_viewer','title':'Xml Viewer','cls':'XmlViewerScreen'},
    {'slug':'zip','title':'Zip','cls':'ZipScreen'},
    {'slug':'zip_tool','title':'Zip Tool','cls':'ZipToolScreen'},

  ];
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WanaLab v3.4.45 - 98 Tools'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.9, crossAxisSpacing: 6, mainAxisSpacing: 6),
        itemCount: tools.length,
        itemBuilder: (ctx, i) {
          final t = tools[i];
          return Card(
            child: InkWell(
              onTap: () {
                Widget screen;
                switch(t['slug']){
                          case 'about': screen = AboutScreen(); break;
                          case 'age_calculator': screen = AgeCalculatorScreen(); break;
                          case 'alarm': screen = AlarmScreen(); break;
                          case 'altitude': screen = AltitudeScreen(); break;
                          case 'app_locker': screen = AppLockerScreen(); break;
                          case 'audio_player': screen = AudioPlayerScreen(); break;
                          case 'backup_restore': screen = BackupRestoreScreen(); break;
                          case 'backup': screen = BackupScreen(); break;
                          case 'barcode_scanner': screen = BarcodeScannerScreen(); break;
                          case 'barcode': screen = BarcodeScreen(); break;
                          case 'battery_info': screen = BatteryInfoScreen(); break;
                          case 'battery': screen = BatteryScreen(); break;
                          case 'binary_converter': screen = BinaryConverterScreen(); break;
                          case 'ble_scanner': screen = BleScannerScreen(); break;
                          case 'ble': screen = BleScreen(); break;
                          case 'bmi_calculator': screen = BmiCalculatorScreen(); break;
                          case 'bmi': screen = BmiScreen(); break;
                          case 'brightness': screen = BrightnessScreen(); break;
                          case 'calculator': screen = CalculatorScreen(); break;
                          case 'coin_flip': screen = CoinFlipScreen(); break;
                          case 'color_picker': screen = ColorPickerScreen(); break;
                          case 'compass': screen = CompassScreen(); break;
                          case 'coordinates': screen = CoordinatesScreen(); break;
                          case 'core': screen = CoreScreen(); break;
                          case 'countdown': screen = CountdownScreen(); break;
                          case 'cpu_info': screen = CpuInfoScreen(); break;
                          case 'currency': screen = CurrencyScreen(); break;
                          case 'date_calculator': screen = DateCalculatorScreen(); break;
                          case 'device_info': screen = DeviceInfoScreen(); break;
                          case 'dice_roller': screen = DiceRollerScreen(); break;
                          case 'dictionary': screen = DictionaryScreen(); break;
                          case 'dns_lookup': screen = DnsLookupScreen(); break;
                          case 'expense_tracker': screen = ExpenseTrackerScreen(); break;
                          case 'file_manager': screen = FileManagerScreen(); break;
                          case 'flashlight': screen = FlashlightScreen(); break;
                          case 'font_viewer': screen = FontViewerScreen(); break;
                          case 'gps': screen = GpsScreen(); break;
                          case 'gps_tracker': screen = GpsTrackerScreen(); break;
                          case 'gradient_maker': screen = GradientMakerScreen(); break;
                          case 'habit_tracker': screen = HabitTrackerScreen(); break;
                          case 'hash_generator': screen = HashGeneratorScreen(); break;
                          case 'health_tracker': screen = HealthTrackerScreen(); break;
                          case 'heart_rate': screen = HeartRateScreen(); break;
                          case 'http_tester': screen = HttpTesterScreen(); break;
                          case 'icon_pack': screen = IconPackScreen(); break;
                          case 'image_editor': screen = ImageEditorScreen(); break;
                          case 'ip_finder': screen = IpFinderScreen(); break;
                          case 'ir_remote': screen = IrRemoteScreen(); break;
                          case 'json_formatter': screen = JsonFormatterScreen(); break;
                          case 'length': screen = LengthScreen(); break;
                          case 'level_tool': screen = LevelToolScreen(); break;
                          case 'loan_calculator': screen = LoanCalculatorScreen(); break;
                          case 'lottery': screen = LotteryScreen(); break;
                          case 'magnetometer': screen = MagnetometerScreen(); break;
                          case 'map': screen = MapScreen(); break;
                          case 'moon_phase': screen = MoonPhaseScreen(); break;
                          case 'morse_code': screen = MorseCodeScreen(); break;
                          case 'mqtt_client': screen = MqttClientScreen(); break;
                          case 'mqtt': screen = MqttScreen(); break;
                          case 'network_speed': screen = NetworkSpeedScreen(); break;
                          case 'nfc_reader': screen = NfcReaderScreen(); break;
                          case 'nfc': screen = NfcScreen(); break;
                          case 'notes': screen = NotesScreen(); break;
                          case 'notification_history': screen = NotificationHistoryScreen(); break;
                          case 'ocr': screen = OcrScreen(); break;
                          case 'ocr_text': screen = OcrTextScreen(); break;
                          case 'offline_map': screen = OfflineMapScreen(); break;
                          case 'password_generator': screen = PasswordGeneratorScreen(); break;
                          case 'pdf_maker': screen = PdfMakerScreen(); break;
                          case 'pdf_scanner': screen = PdfScannerScreen(); break;
                          case 'pdf': screen = PdfScreen(); break;
                          case 'permission_manager': screen = PermissionManagerScreen(); break;
                          case 'ping_tool': screen = PingToolScreen(); break;
                          case 'pomodoro': screen = PomodoroScreen(); break;
                          case 'port_scanner': screen = PortScannerScreen(); break;
                          case 'prayer': screen = PrayerScreen(); break;
                          case 'prayer_times': screen = PrayerTimesScreen(); break;
                          case 'protractor': screen = ProtractorScreen(); break;
                          case 'qibla_finder': screen = QiblaFinderScreen(); break;
                          case 'qibla': screen = QiblaScreen(); break;
                          case 'qr_maker': screen = QrMakerScreen(); break;
                          case 'qr_scanner': screen = QrScannerScreen(); break;
                          case 'qr': screen = QrScreen(); break;
                          case 'quote_day': screen = QuoteDayScreen(); break;
                          case 'ram_info': screen = RamInfoScreen(); break;
                          case 'random_number': screen = RandomNumberScreen(); break;
                          case 'ruler': screen = RulerScreen(); break;
                          case 'sensor': screen = SensorScreen(); break;
                          case 'sensor_test': screen = SensorTestScreen(); break;
                          case 'speedometer': screen = SpeedometerScreen(); break;
                          case 'step_counter': screen = StepCounterScreen(); break;
                          case 'stopwatch': screen = StopwatchScreen(); break;
                          case 'storage_analyzer': screen = StorageAnalyzerScreen(); break;
                          case 'sun_calculator': screen = SunCalculatorScreen(); break;
                          case 'theme_engine': screen = ThemeEngineScreen(); break;
                          case 'theme': screen = ThemeScreen(); break;
                          case 'timer': screen = TimerScreen(); break;
                          case 'tip_calculator': screen = TipCalculatorScreen(); break;
                          case 'todo_list': screen = TodoListScreen(); break;
                          case 'todo': screen = TodoScreen(); break;
                          case 'translator': screen = TranslatorScreen(); break;
                          case 'unit_converter': screen = UnitConverterScreen(); break;
                          case 'usb_info': screen = UsbInfoScreen(); break;
                          case 'user_agent': screen = UserAgentScreen(); break;
                          case 'vibration': screen = VibrationScreen(); break;
                          case 'video_player': screen = VideoPlayerScreen(); break;
                          case 'voice_recorder': screen = VoiceRecorderScreen(); break;
                          case 'wallpaper': screen = WallpaperScreen(); break;
                          case 'water_reminder': screen = WaterReminderScreen(); break;
                          case 'weather': screen = WeatherScreen(); break;
                          case 'weight': screen = WeightScreen(); break;
                          case 'whois': screen = WhoisScreen(); break;
                          case 'wifi_analyzer': screen = WifiAnalyzerScreen(); break;
                          case 'wifi': screen = WifiScreen(); break;
                          case 'world_clock': screen = WorldClockScreen(); break;
                          case 'xml_viewer': screen = XmlViewerScreen(); break;
                          case 'zip': screen = ZipScreen(); break;
                          case 'zip_tool': screen = ZipToolScreen(); break;

                  default: screen = Scaffold(appBar: AppBar(title: Text(t['title'] as String)), body: Center(child: Text(t['title'] as String))); break;
                }
                Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
              },
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.widgets, color: Color(0xFF2563EB), size: 28),
                SizedBox(height: 6),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text(t['title'] as String, textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold))),
                Text('#${i+1}', style: TextStyle(fontSize: 8, color: Colors.grey)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
