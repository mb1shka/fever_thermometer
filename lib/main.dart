
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temperature/my_colors.dart';
import 'package:temperature/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:temperature/pages/intro_screen.dart';
import 'package:temperature/pages/payment_page.dart';

import 'listeners/settings_listener.dart';

late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsListener>(create: (context) => SettingsListener()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          chipTheme: ChipThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.white,
            disabledColor: Colors.white,
            selectedColor: MyColors.orange,
            secondarySelectedColor: MyColors.orange,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            secondaryLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            brightness: Brightness.dark,
          ),
        ),
        home: (prefs.getBool('isFirstRun') ?? true) ? IntroScreen() : PaymentPage(),
      ),
    );
  }

}