import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temperature/custom_icons.dart';
import 'package:temperature/database/temperature_data_base.dart';
import 'package:temperature/model/degree.dart';
import 'package:temperature/model/health.dart';
import 'package:temperature/model/measurement_fields.dart';
import 'package:temperature/model/symptoms.dart';
import 'dart:math' as math;
import 'package:slider_gradient/slider_gradient.dart';

import 'package:temperature/my_colors.dart';
import 'package:temperature/pages/additional_data.dart';

class MyTemperaturePage extends StatefulWidget {
  const MyTemperaturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTemperaturePageState();
}

class _MyTemperaturePageState extends State<MyTemperaturePage> {
  final inputTempFocus = FocusNode();
  List<Symptoms> symptoms = [];
  String notes = ' ';
  Degree degree = Degree.C;
  bool isC = true;
  bool isF = false;

  double val1 = 34;
  double val2 = 44;

  String tempValue = '34.00';
  String tempValueF = '93.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              MyColors.blandPurple,
              const Color(0x006D73E1),
            ])),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'My temperature',
                  style: TextStyle(
                    color: MyColors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 65),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CustomIcons.minus,
                              color: MyColors.purple,
                              size: 2,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isC ? tempValue : tempValueF,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          isF ? Text(
                            ' °F',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: MyColors.grey),
                          ) :
                          Text(
                            ' °C',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: MyColors.grey),
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CustomIcons.plus,
                            color: MyColors.orange,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SvgPicture.asset('assets/svg/union.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 35, 8, 0),
                      child: SliderGradient(
                        thumbStyle: const ThumbStyle(
                          borderColor: Colors.white,
                          width: 32,
                          height: 32,
                          radius: 18,
                        ),
                        sliderStyle: const SliderStyle(
                          height: 5,
                        ),
                        min: 34,
                        max: 44,
                        isShowLabel: true,
                        value: val1,
                        onChange: (valData) {
                          setState(() {
                            val1 = valData.value;
                            tempValue = valData.value.toString();
                            tempValueF = countF(valData.value).toStringAsFixed(2);
                          });
                        },
                        colors: [
                          MyColors.purple,
                          MyColors.green,
                          MyColors.yellow,
                          MyColors.red,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Container(
                  height: 60,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: const Color(0xFFF7F7F7),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
                        child: ElevatedButton(
                          onPressed: isC
                              ? null
                              : () => setState(() {
                                    isC = true;
                                    isF = false;
                                    degree = Degree.C;
                                  }),
                          child: const Text(
                            '°C',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return const Color(0xFFFDFDFD);
                                }
                                return const Color(0xFFF7F7F7);
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith<
                                    RoundedRectangleBorder>(
                                (Set<MaterialState> states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              );
                            }),
                            fixedSize: MaterialStateProperty.resolveWith<Size>(
                              (states) => const Size(64, 52),
                            ),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.black;
                              }
                              return MyColors.grey;
                            }),
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return 0.0;
                              }
                              return 0.0;
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: isF
                              ? null
                              : () => setState(() {
                                    isF = true;
                                    isC = false;
                                    degree = Degree.F;
                                  }),
                          child: const Text(
                            '°F',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<
                                    RoundedRectangleBorder>(
                                (Set<MaterialState> states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              );
                            }),
                            fixedSize: MaterialStateProperty.resolveWith<Size>(
                              (states) => const Size(64, 52),
                            ),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.black;
                              }
                              return MyColors.grey;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return const Color(0xFFFDFDFD);
                                }
                                return const Color(0xFFF7F7F7);
                              },
                            ),
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return 0.0;
                              }
                              return 0.0;
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: () async {
                    /*setState(() {
                      _comment = _controller.text;
                    });
                    await TemperatureDataBase.instance.create(Measurement(
                      //temperature: _comment as int,
                      temperature: 0,
                      //TODO
                      degree: Degree.F,
                      health: Health.normal,
                      symptoms: symptoms,
                      notes: notes,
                      dateTime: DateTime.now(),
                    ));*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AdditionalData(
                              isC ? tempValue : tempValueF,
                              degree
                          ),
                        ));
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.orange,
                      fixedSize: const Size(72, 72),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'measurement',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  double countF(double value) {
    return value * 9/5 + 32;
  }
}
