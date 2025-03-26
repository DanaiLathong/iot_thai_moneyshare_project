import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_thai_moneyshare_project/views/money_result_ui.dart';
import 'package:iot_thai_moneyshare_project/views/splash_screen_ui.dart';

void main() {
  runApp(IoTThaiMoneyshare());
}

class IoTThaiMoneyshare extends StatefulWidget {
  const IoTThaiMoneyshare({super.key});

  @override
  State<IoTThaiMoneyshare> createState() => _IoTThaiMoneyshareState();
}

class _IoTThaiMoneyshareState extends State<IoTThaiMoneyshare> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenUi(),
        theme: ThemeData(
            textTheme:
                GoogleFonts.kanitTextTheme(Theme.of(context).textTheme)));
  }
}
