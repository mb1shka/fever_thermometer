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

class AddMeasurementPage extends StatefulWidget {
  const AddMeasurementPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddMeasurementPageState();
}

class _AddMeasurementPageState extends State<AddMeasurementPage> {
  final _controller = TextEditingController();
  final inputTempFocus = FocusNode();
  String _comment = ' ';
  List<Symptoms> symptoms = [];
  String notes = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
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
                  const SizedBox(
                    width: 78,
                  ),
                  Text(
                    'New measurement',
                    style: TextStyle(
                      color: MyColors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            SvgPicture.asset('assets/svg/thermometer.svg'),
            const SizedBox(height: 10),
            const Text(
              'Enter your data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 0, 12, 0),
                  child: SizedBox(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                ),
                //TODO: to make a switch widget from F to C
              ],
            ),
            const SizedBox(height: 28),
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
                      builder: (_) => AdditionalData(),
                    ));
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: MyColors.orange,
                  fixedSize: const Size(327, 60),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
