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

import 'package:temperature/my_colors.dart';
import 'package:temperature/pages/additional_data.dart';

class MyTemperaturePage extends StatefulWidget {
  const MyTemperaturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTemperaturePageState();
}

class _MyTemperaturePageState extends State<MyTemperaturePage> {
  final _controller = TextEditingController();
  final inputTempFocus = FocusNode();
  String _comment = ' ';
  List<Symptoms> symptoms = [];
  String notes = ' ';
  Degree degree = Degree.C;
  bool isC = true;
  bool isF = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                MyColors.blandPurple,
                const Color(0xFFFFFFFF),
              ]
          )
        ),
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
                const SizedBox(height: 57),
                SizedBox(
                  height: 75,
                  width: 145,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                    onEditingComplete: () => setState(() {
                      _controller.text = _controller.text
                          .replaceAllMapped(RegExp(r'(\d\d)(\d)'), (match) {
                        return '${match.group(1)}.${match.group(2)}';
                      });
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());
                    }),
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.grey),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: '00.0',
                      filled: true,
                      fillColor: MyColors.lightGrey,
                    ),
                  ),
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
                          child: const Text('°C',
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
                                }
                            ),
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
                          child: const Text('°F',
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
                                return Color(0xFFF7F7F7);
                              },
                            ),
                            elevation:
                            MaterialStateProperty.resolveWith<double>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return 0.0;
                                  }
                                  return 0.0;
                                }
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
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
                    ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AdditionalData(_comment, degree),
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
}
