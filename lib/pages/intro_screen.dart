import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature/main.dart';
import 'package:temperature/pages/intro_widget.dart';
import 'package:temperature/pages/payment_page.dart';

import '../my_colors.dart';

class IntroScreen extends StatelessWidget {

  final _pageController = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  MyColors.blandPurple,
                  const Color(0x006D73E1),
                ]
            )
        ),
        child: PageView(
          controller: _pageController,
          children: [
            IntroWidget(
                title: 'Smart Diary',
                description: 'Log the body temperature with \n'
                    'current mood, time, symptoms, \n'
                    'and other notes.',
                svgPicture: 'assets/svg/listFirst.svg',
                onNext: _onNext,
                height: 120,
            ),
            IntroWidget(
              title: 'Self check',
              description: 'Remember details such as \n'
                  'when symptoms began, how\n'
                  'the fever got.',
              svgPicture: 'assets/svg/listSecond.svg',
              onNext: _onNext,
              height: 63,
            ),
            IntroWidget(
              title: 'Health insights',
              description: 'Catch the disease in ints early stage \n'
                  'and track symptoms. Celsius and\n'
                  'Fahrenheit units are supported.',
              svgPicture: 'assets/svg/listThird.svg',
              onNext: () {
                prefs.setBool('isFirstRun', false);
                Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentPage()));
              },
              height: 63,
            ),
            //3 странички без скэффолда
          ],
        ),
      ),
    );
  }


  void _onNext() {
    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}