import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:temperature/my_colors.dart';
import 'package:temperature/pages/my_temperature_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          disabledColor: Colors.white,
          selectedColor: MyColors.orange,
          secondarySelectedColor: MyColors.orange,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          secondaryLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          brightness: Brightness.dark,
        ),
      ),
      home: MyTemperaturePage(),
    );
  }

}