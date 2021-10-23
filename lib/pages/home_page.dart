import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:temperature/my_colors.dart';
import 'package:temperature/custom_icons.dart';
import 'package:temperature/pages/history_page.dart';
import 'package:temperature/pages/my_temperature_page.dart';
import 'package:temperature/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> tabs = [
    const HistoryPage(),
    const MyTemperaturePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFFFFFFF),
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            fixedColor: MyColors.orange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.history),
                label: '\n   History',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.temperature,
                  size: 40,
                ),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.tab_settings),
                label: '\n Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
      body: tabs.elementAt(_selectedIndex),
    );
  }
}
