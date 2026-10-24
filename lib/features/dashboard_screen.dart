import 'package:flutter/material.dart';
import 'gps_tracker_screen.dart';
import 'offline_map_screen.dart';
import 'compass_screen.dart';
import 'qibla_finder_screen.dart';
import 'prayer_times_screen.dart';
import 'altitude_screen.dart';
import 'weather_screen.dart';
import 'sun_calculator_screen.dart';
import 'moon_phase_screen.dart';
import 'coordinates_screen.dart';
import 'barcode_scanner_screen.dart';
import 'qr_scanner_screen.dart';
import 'qr_maker_screen.dart';
import 'ocr_text_screen.dart';
import 'nfc_reader_screen.dart';
import 'ble_scanner_screen.dart';
import 'wifi_analyzer_screen.dart';
import 'usb_info_screen.dart';
import 'ir_remote_screen.dart';
import 'magnetometer_screen.dart';
import 'bmi_calculator_screen.dart';
import 'unit_converter_screen.dart';
import 'calculator_screen.dart';
import 'age_calculator_screen.dart';
import 'loan_calculator_screen.dart';
import 'tip_calculator_screen.dart';
import 'date_calculator_screen.dart';
import 'currency_screen.dart';
import 'length_screen.dart';
import 'weight_screen.dart';
import 'pdf_maker_screen.dart';
import 'pdf_scanner_screen.dart';
import 'zip_tool_screen.dart';
import 'file_manager_screen.dart';
import 'notes_screen.dart';
import 'todo_list_screen.dart';
import 'voice_recorder_screen.dart';
import 'audio_player_screen.dart';
import 'video_player_screen.dart';
import 'image_editor_screen.dart';
import 'battery_info_screen.dart';
import 'device_info_screen.dart';
import 'sensor_test_screen.dart';
import 'storage_analyzer_screen.dart';
import 'ram_info_screen.dart';
import 'cpu_info_screen.dart';
import 'network_speed_screen.dart';
import 'flashlight_screen.dart';
import 'vibration_screen.dart';
import 'brightness_screen.dart';
import 'theme_engine_screen.dart';
import 'icon_pack_screen.dart';
import 'wallpaper_screen.dart';
import 'font_viewer_screen.dart';
import 'color_picker_screen.dart';
import 'gradient_maker_screen.dart';
import 'backup_restore_screen.dart';
import 'app_locker_screen.dart';
import 'permission_manager_screen.dart';
import 'notification_history_screen.dart';
import 'timer_screen.dart';
import 'stopwatch_screen.dart';
import 'alarm_screen.dart';
import 'world_clock_screen.dart';
import 'countdown_screen.dart';
import 'pomodoro_screen.dart';
import 'speedometer_screen.dart';
import 'level_tool_screen.dart';
import 'ruler_screen.dart';
import 'protractor_screen.dart';
import 'translator_screen.dart';
import 'dictionary_screen.dart';
import 'morse_code_screen.dart';
import 'binary_converter_screen.dart';
import 'hash_generator_screen.dart';
import 'password_generator_screen.dart';
import 'random_number_screen.dart';
import 'dice_roller_screen.dart';
import 'coin_flip_screen.dart';
import 'lottery_screen.dart';
import 'mqtt_client_screen.dart';
import 'http_tester_screen.dart';
import 'ping_tool_screen.dart';
import 'port_scanner_screen.dart';
import 'ip_finder_screen.dart';
import 'dns_lookup_screen.dart';
import 'whois_screen.dart';
import 'user_agent_screen.dart';
import 'json_formatter_screen.dart';
import 'xml_viewer_screen.dart';
import 'health_tracker_screen.dart';
import 'step_counter_screen.dart';
import 'heart_rate_screen.dart';
import 'water_reminder_screen.dart';
import 'expense_tracker_screen.dart';
import 'habit_tracker_screen.dart';
import 'quote_day_screen.dart';
import 'about_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final tools = [
    {'slug':'gps_tracker','title':'GPS Tracker','icon':Icons.gps_fixed},
    {'slug':'offline_map','title':'Offline Map','icon':Icons.map},
    {'slug':'compass','title':'Compass','icon':Icons.explore},
    {'slug':'qibla_finder','title':'Qibla Finder','icon':Icons.location_on},
    {'slug':'prayer_times','title':'Prayer Times','icon':Icons.access_time},
    {'slug':'altitude','title':'Altitude','icon':Icons.landscape},
    {'slug':'weather','title':'Weather','icon':Icons.cloud},
    {'slug':'sun_calculator','title':'Sun Calculator','icon':Icons.wb_sunny},
    {'slug':'moon_phase','title':'Moon Phase','icon':Icons.nightlight},
    {'slug':'coordinates','title':'Coordinates','icon':Icons.my_location},
    {'slug':'barcode_scanner','title':'Barcode Scanner','icon':Icons.qr_code_scanner},
    {'slug':'qr_scanner','title':'QR Scanner','icon':Icons.qr_code},
    {'slug':'qr_maker','title':'QR Maker','icon':Icons.qr_code_2},
    {'slug':'ocr_text','title':'OCR Text','icon':Icons.text_fields},
    {'slug':'nfc_reader','title':'NFC Reader','icon':Icons.contactless},
    {'slug':'ble_scanner','title':'BLE Scanner','icon':Icons.bluetooth},
    {'slug':'wifi_analyzer','title':'WiFi Analyzer','icon':Icons.wifi},
    {'slug':'usb_info','title':'USB Info','icon':Icons.usb_rounded},
    {'slug':'ir_remote','title':'IR Remote','icon':Icons.settings_remote},
    {'slug':'magnetometer','title':'Magnetometer','icon':Icons.explore},
    {'slug':'bmi_calculator','title':'BMI Calculator','icon':Icons.fitness_center},
    {'slug':'unit_converter','title':'Unit Converter','icon':Icons.swap_horiz},
    {'slug':'calculator','title':'Calculator','icon':Icons.calculate},
    {'slug':'age_calculator','title':'Age Calculator','icon':Icons.cake},
    {'slug':'loan_calculator','title':'Loan Calculator','icon':Icons.account_balance},
    {'slug':'tip_calculator','title':'Tip Calculator','icon':Icons.payments},
    {'slug':'date_calculator','title':'Date Calculator','icon':Icons.date_range},
    {'slug':'currency','title':'Currency','icon':Icons.currency_exchange},
    {'slug':'length','title':'Length Converter','icon':Icons.straighten},
    {'slug':'weight','title':'Weight Converter','icon':Icons.balance},
    {'slug':'pdf_maker','title':'PDF Maker','icon':Icons.picture_as_pdf},
    {'slug':'pdf_scanner','title':'PDF Scanner','icon':Icons.scanner},
    {'slug':'zip_tool','title':'ZIP Tool','icon':Icons.folder_zip},
    {'slug':'file_manager','title':'File Manager','icon':Icons.folder},
    {'slug':'notes','title':'Notes','icon':Icons.note},
    {'slug':'todo_list','title':'Todo List','icon':Icons.checklist},
    {'slug':'voice_recorder','title':'Voice Recorder','icon':Icons.mic},
    {'slug':'audio_player','title':'Audio Player','icon':Icons.music_note},
    {'slug':'video_player','title':'Video Player','icon':Icons.video_library},
    {'slug':'image_editor','title':'Image Editor','icon':Icons.image},
    {'slug':'battery_info','title':'Battery Info','icon':Icons.battery_full},
    {'slug':'device_info','title':'Device Info','icon':Icons.devices},
    {'slug':'sensor_test','title':'Sensor Test','icon':Icons.sensors},
    {'slug':'storage_analyzer','title':'Storage Analyzer','icon':Icons.storage},
    {'slug':'ram_info','title':'RAM Info','icon':Icons.memory},
    {'slug':'cpu_info','title':'CPU Info','icon':Icons.computer},
    {'slug':'network_speed','title':'Network Speed','icon':Icons.speed},
    {'slug':'flashlight','title':'Flashlight','icon':Icons.flashlight_on},
    {'slug':'vibration','title':'Vibration Test','icon':Icons.vibration},
    {'slug':'brightness','title':'Brightness','icon':Icons.brightness_6},
    {'slug':'theme_engine','title':'Theme Engine','icon':Icons.palette},
    {'slug':'icon_pack','title':'Icon Pack','icon':Icons.category},
    {'slug':'wallpaper','title':'Wallpaper','icon':Icons.wallpaper},
    {'slug':'font_viewer','title':'Font Viewer','icon':Icons.font_download},
    {'slug':'color_picker','title':'Color Picker','icon':Icons.color_lens},
    {'slug':'gradient_maker','title':'Gradient Maker','icon':Icons.gradient},
    {'slug':'backup_restore','title':'Backup Restore','icon':Icons.backup},
    {'slug':'app_locker','title':'App Locker','icon':Icons.lock},
    {'slug':'permission_manager','title':'Permission Manager','icon':Icons.admin_panel_settings},
    {'slug':'notification_history','title':'Notification History','icon':Icons.notifications},
    {'slug':'timer','title':'Timer','icon':Icons.timer},
    {'slug':'stopwatch','title':'Stopwatch','icon':Icons.timer_10},
    {'slug':'alarm','title':'Alarm','icon':Icons.alarm},
    {'slug':'world_clock','title':'World Clock','icon':Icons.public},
    {'slug':'countdown','title':'Countdown','icon':Icons.hourglass_bottom},
    {'slug':'pomodoro','title':'Pomodoro','icon':Icons.timelapse},
    {'slug':'speedometer','title':'Speedometer','icon':Icons.speed},
    {'slug':'level_tool','title':'Level Tool','icon':Icons.straighten},
    {'slug':'ruler','title':'Ruler','icon':Icons.straighten},
    {'slug':'protractor','title':'Protractor','icon':Icons.architecture},
    {'slug':'translator','title':'Translator','icon':Icons.translate},
    {'slug':'dictionary','title':'Dictionary','icon':Icons.menu_book},
    {'slug':'morse_code','title':'Morse Code','icon':Icons.code},
    {'slug':'binary_converter','title':'Binary Converter','icon':Icons.transform},
    {'slug':'hash_generator','title':'Hash Generator','icon':Icons.fingerprint},
    {'slug':'password_generator','title':'Password Generator','icon':Icons.key},
    {'slug':'random_number','title':'Random Number','icon':Icons.casino},
    {'slug':'dice_roller','title':'Dice Roller','icon':Icons.casino},
    {'slug':'coin_flip','title':'Coin Flip','icon':Icons.toll},
    {'slug':'lottery','title':'Lottery','icon':Icons.confirmation_number},
    {'slug':'mqtt_client','title':'MQTT Client','icon':Icons.cloud_sync},
    {'slug':'http_tester','title':'HTTP Tester','icon':Icons.http},
    {'slug':'ping_tool','title':'Ping Tool','icon':Icons.network_ping},
    {'slug':'port_scanner','title':'Port Scanner','icon':Icons.router},
    {'slug':'ip_finder','title':'IP Finder','icon':Icons.language},
    {'slug':'dns_lookup','title':'DNS Lookup','icon':Icons.dns},
    {'slug':'whois','title':'WHOIS','icon':Icons.info},
    {'slug':'user_agent','title':'User Agent','icon':Icons.computer},
    {'slug':'json_formatter','title':'JSON Formatter','icon':Icons.data_object},
    {'slug':'xml_viewer','title':'XML Viewer','icon':Icons.code},
    {'slug':'health_tracker','title':'Health Tracker','icon':Icons.favorite},
    {'slug':'step_counter','title':'Step Counter','icon':Icons.directions_walk},
    {'slug':'heart_rate','title':'Heart Rate','icon':Icons.monitor_heart},
    {'slug':'water_reminder','title':'Water Reminder','icon':Icons.water_drop},
    {'slug':'expense_tracker','title':'Expense Tracker','icon':Icons.receipt_long},
    {'slug':'habit_tracker','title':'Habit Tracker','icon':Icons.task_alt},
    {'slug':'quote_day','title':'Quote of Day','icon':Icons.format_quote},
    {'slug':'about','title':'About','icon':Icons.info},
  ];
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WanaLab v3.4.45 - 98 Tools'), backgroundColor: Color(0xFF2563EB), foregroundColor: Colors.white),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.9, crossAxisSpacing: 6, mainAxisSpacing: 6),
        itemCount: tools.length,
        itemBuilder: (ctx,idx) {
          final t = tools[idx];
          return Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                final slug = t['slug'] as String;
                Widget screen;
                switch(slug) {
      'gps_tracker': (ctx) => GpsTrackerScreen(),
      'offline_map': (ctx) => OfflineMapScreen(),
      'compass': (ctx) => CompassScreen(),
      'qibla_finder': (ctx) => QiblaFinderScreen(),
      'prayer_times': (ctx) => PrayerTimesScreen(),
      'altitude': (ctx) => AltitudeScreen(),
      'weather': (ctx) => WeatherScreen(),
      'sun_calculator': (ctx) => SunCalculatorScreen(),
      'moon_phase': (ctx) => MoonPhaseScreen(),
      'coordinates': (ctx) => CoordinatesScreen(),
      'barcode_scanner': (ctx) => BarcodeScannerScreen(),
      'qr_scanner': (ctx) => QrScannerScreen(),
      'qr_maker': (ctx) => QrMakerScreen(),
      'ocr_text': (ctx) => OcrTextScreen(),
      'nfc_reader': (ctx) => NfcReaderScreen(),
      'ble_scanner': (ctx) => BleScannerScreen(),
      'wifi_analyzer': (ctx) => WifiAnalyzerScreen(),
      'usb_info': (ctx) => UsbInfoScreen(),
      'ir_remote': (ctx) => IrRemoteScreen(),
      'magnetometer': (ctx) => MagnetometerScreen(),
      'bmi_calculator': (ctx) => BmiCalculatorScreen(),
      'unit_converter': (ctx) => UnitConverterScreen(),
      'calculator': (ctx) => CalculatorScreen(),
      'age_calculator': (ctx) => AgeCalculatorScreen(),
      'loan_calculator': (ctx) => LoanCalculatorScreen(),
      'tip_calculator': (ctx) => TipCalculatorScreen(),
      'date_calculator': (ctx) => DateCalculatorScreen(),
      'currency': (ctx) => CurrencyScreen(),
      'length': (ctx) => LengthScreen(),
      'weight': (ctx) => WeightScreen(),
      'pdf_maker': (ctx) => PdfMakerScreen(),
      'pdf_scanner': (ctx) => PdfScannerScreen(),
      'zip_tool': (ctx) => ZipToolScreen(),
      'file_manager': (ctx) => FileManagerScreen(),
      'notes': (ctx) => NotesScreen(),
      'todo_list': (ctx) => TodoListScreen(),
      'voice_recorder': (ctx) => VoiceRecorderScreen(),
      'audio_player': (ctx) => AudioPlayerScreen(),
      'video_player': (ctx) => VideoPlayerScreen(),
      'image_editor': (ctx) => ImageEditorScreen(),
      'battery_info': (ctx) => BatteryInfoScreen(),
      'device_info': (ctx) => DeviceInfoScreen(),
      'sensor_test': (ctx) => SensorTestScreen(),
      'storage_analyzer': (ctx) => StorageAnalyzerScreen(),
      'ram_info': (ctx) => RamInfoScreen(),
      'cpu_info': (ctx) => CpuInfoScreen(),
      'network_speed': (ctx) => NetworkSpeedScreen(),
      'flashlight': (ctx) => FlashlightScreen(),
      'vibration': (ctx) => VibrationScreen(),
      'brightness': (ctx) => BrightnessScreen(),
      'theme_engine': (ctx) => ThemeEngineScreen(),
      'icon_pack': (ctx) => IconPackScreen(),
      'wallpaper': (ctx) => WallpaperScreen(),
      'font_viewer': (ctx) => FontViewerScreen(),
      'color_picker': (ctx) => ColorPickerScreen(),
      'gradient_maker': (ctx) => GradientMakerScreen(),
      'backup_restore': (ctx) => BackupRestoreScreen(),
      'app_locker': (ctx) => AppLockerScreen(),
      'permission_manager': (ctx) => PermissionManagerScreen(),
      'notification_history': (ctx) => NotificationHistoryScreen(),
      'timer': (ctx) => TimerScreen(),
      'stopwatch': (ctx) => StopwatchScreen(),
      'alarm': (ctx) => AlarmScreen(),
      'world_clock': (ctx) => WorldClockScreen(),
      'countdown': (ctx) => CountdownScreen(),
      'pomodoro': (ctx) => PomodoroScreen(),
      'speedometer': (ctx) => SpeedometerScreen(),
      'level_tool': (ctx) => LevelToolScreen(),
      'ruler': (ctx) => RulerScreen(),
      'protractor': (ctx) => ProtractorScreen(),
      'translator': (ctx) => TranslatorScreen(),
      'dictionary': (ctx) => DictionaryScreen(),
      'morse_code': (ctx) => MorseCodeScreen(),
      'binary_converter': (ctx) => BinaryConverterScreen(),
      'hash_generator': (ctx) => HashGeneratorScreen(),
      'password_generator': (ctx) => PasswordGeneratorScreen(),
      'random_number': (ctx) => RandomNumberScreen(),
      'dice_roller': (ctx) => DiceRollerScreen(),
      'coin_flip': (ctx) => CoinFlipScreen(),
      'lottery': (ctx) => LotteryScreen(),
      'mqtt_client': (ctx) => MqttClientScreen(),
      'http_tester': (ctx) => HttpTesterScreen(),
      'ping_tool': (ctx) => PingToolScreen(),
      'port_scanner': (ctx) => PortScannerScreen(),
      'ip_finder': (ctx) => IpFinderScreen(),
      'dns_lookup': (ctx) => DnsLookupScreen(),
      'whois': (ctx) => WhoisScreen(),
      'user_agent': (ctx) => UserAgentScreen(),
      'json_formatter': (ctx) => JsonFormatterScreen(),
      'xml_viewer': (ctx) => XmlViewerScreen(),
      'health_tracker': (ctx) => HealthTrackerScreen(),
      'step_counter': (ctx) => StepCounterScreen(),
      'heart_rate': (ctx) => HeartRateScreen(),
      'water_reminder': (ctx) => WaterReminderScreen(),
      'expense_tracker': (ctx) => ExpenseTrackerScreen(),
      'habit_tracker': (ctx) => HabitTrackerScreen(),
      'quote_day': (ctx) => QuoteDayScreen(),
      'about': (ctx) => AboutScreen(),

                  default: screen = Scaffold(appBar: AppBar(title: Text(t['title'] as String)), body: Center(child: Text(t['title'] as String)));
                }
                Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
              },
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(t['icon'] as IconData, color: Color(0xFF2563EB), size: 28),
                SizedBox(height: 6),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text(t['title'] as String, textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold))),
                Text('#${idx+1}', style: TextStyle(fontSize: 8, color: Colors.grey)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
