import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:iot_thai_moneyshare_project/view/splash_screen_ui.dart";

void main() {
  runApp(
      //เรียกใช้คลาสที่เรียกใช้ widget หลักของแอปฯ MaterialApp()
      IoTThaiMoneyshare());
}

//---------------------------------
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
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
