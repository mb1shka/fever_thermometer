import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temperature/model/health.dart';
import 'package:temperature/model/symptoms.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import '../custom_icons.dart';
import '../my_colors.dart';

class ShowMeasurementDetails extends StatelessWidget {
  final String temperature;
  final String degree;
  final Health health;
  final List<Symptoms> symptoms;
  final String notes;
  final DateTime dateTime;
  final String vaccine;

  ShowMeasurementDetails(
      {required this.temperature,
      required this.degree,
      required this.health,
      required this.symptoms,
      required this.notes,
      required this.dateTime,
      required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Measurement details',
            style: TextStyle(
              color: MyColors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        leading:
          Transform.rotate(
            angle: 180 * math.pi / 180,
            child: IconButton(
              icon: const Icon(
                CustomIcons.disclosure,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                MyColors.blandPurple,
                const Color(0x006D73E1),
              ])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 32, 16, 20),
                                child: SvgPicture.asset(
                                  'assets/svg/min_temperature.svg',
                                  height: 30,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 5, 20),
                                child: Text(
                                  temperature,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 32, 10, 20),
                                child: Text(
                                  '°' + degree.substring(7),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 16, 34),
                                child: SvgPicture.asset(
                                    'assets/svg/clock.svg',
                                    height: 20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 24, 34),
                                child: Text(
                                  _fmtDateTime(dateTime),
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      showContainer(),
                    ],
                  ),
                  const SizedBox(height: 61),
                  const Text(
                    'Symptoms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 57),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: List.generate(
                          symptoms.length,
                          (index) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: MyColors.orange,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    symptoms[index].asString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                  const SizedBox(height: 57),
                  const Text(
                    'Notes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        notes,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Vaccine',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        vaccine,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _fmtDateTime(DateTime dateTime) {
    return DateFormat('MMM d, HH:mm a').format(dateTime);
  }

  Widget showContainer() {
    Color color = checkColor();
    SvgPicture svgPicture = checkSvg();
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(19, 21, 19, 21),
        child: svgPicture,
      ),
    );
  }

  Color checkColor() {
    switch (health) {
      case Health.good:
        return MyColors.green;
      case Health.normal:
        return MyColors.yellow;
      case Health.bad:
        return MyColors.red;
    }
  }

  SvgPicture checkSvg() {
    switch (health) {
      case Health.good:
        return SvgPicture.asset('assets/svg/good.svg');
      case Health.normal:
        return SvgPicture.asset('assets/svg/normal_selected.svg');
      case Health.bad:
        return SvgPicture.asset('assets/svg/bad.svg');
    }
  }
}
