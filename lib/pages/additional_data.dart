import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temperature/model/symptom_model.dart';
import 'package:temperature/model/symptoms.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import '../custom_icons.dart';
import '../my_colors.dart';

class AdditionalData extends StatefulWidget {
  AdditionalData(this.temperatureMeasurement);

  final String temperatureMeasurement;

  @override
  State<StatefulWidget> createState() => _AdditionalDataState();
}

class _AdditionalDataState extends State<AdditionalData> {
  final List<SymptomModel> _symptomModelsFirstList = [
    SymptomModel(symptom: Symptoms.abdominalDiscomfort),
    SymptomModel(symptom: Symptoms.bradycardia),
    SymptomModel(symptom: Symptoms.bodyAchesAndPains),
    SymptomModel(symptom: Symptoms.chill),
    SymptomModel(symptom: Symptoms.cough),
    SymptomModel(symptom: Symptoms.drowsiness),
    SymptomModel(symptom: Symptoms.dizziness),
    SymptomModel(symptom: Symptoms.headache),
    SymptomModel(symptom: Symptoms.fever),
    SymptomModel(symptom: Symptoms.hoarseness),
  ];
  final List<SymptomModel> _symptomModelsSecondList = [
    SymptomModel(symptom: Symptoms.highBloodPressure),
    SymptomModel(symptom: Symptoms.irritability),
    SymptomModel(symptom: Symptoms.migraine),
    SymptomModel(symptom: Symptoms.nausea),
    SymptomModel(symptom: Symptoms.rash),
    SymptomModel(symptom: Symptoms.shortnessOfBreath),
    SymptomModel(symptom: Symptoms.rapidPulse),
    SymptomModel(symptom: Symptoms.lossOfAppetite),
    SymptomModel(symptom: Symptoms.sleepDisorder),
  ];
  final DateTime _dateTime = DateTime.now();
  final _notesController = TextEditingController();
  final _vaccineController = TextEditingController();

  bool _isGood = false;
  bool _isNormal = false;
  bool _isBad = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3, 16, 0, 0),
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
                        'Additional data',
                        style: TextStyle(
                          color: MyColors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                    child: Text(
                  widget.temperatureMeasurement + ' °F',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                )),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Today, ' + DateFormat.jm().format(_dateTime),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                Text(
                  'Choose health',
                  style: TextStyle(
                    color: MyColors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: _isGood
                                ? null
                                : () => setState(() {
                                      _isGood = true;
                                      _isNormal = false;
                                      _isBad = false;
                                    }),
                            child: _isGood == true
                                ? SvgPicture.asset('assets/svg/good.svg')
                                : SvgPicture.asset('assets/svg/good_selected.svg'),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith<
                                    RoundedRectangleBorder>(
                                        (Set<MaterialState> states) {
                                      return RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        side: const BorderSide(color: Colors.white),
                                      );
                                    }),
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.disabled)) {
                                          return MyColors.green;
                                        }
                                        return Colors.white;
                                      },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: _isNormal
                                ? null
                                : () => setState(() {
                              _isGood = false;
                              _isNormal = true;
                              _isBad = false;
                            }),
                            child: _isNormal == true
                                ? SvgPicture.asset('assets/svg/normal_selected.svg')
                                : SvgPicture.asset('assets/svg/normal.svg'),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                                      (Set<MaterialState> states) {
                                    return RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.white),
                                    );
                                  }),
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return MyColors.yellow;
                                  }
                                  return Colors.white;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: _isBad
                                ? null
                                : () => setState(() {
                              _isGood = false;
                              _isNormal = false;
                              _isBad = true;
                            }),
                            child: _isBad == true
                                ? SvgPicture.asset('assets/svg/bad.svg')
                                : SvgPicture.asset('assets/svg/bad_selected.svg'),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                                      (Set<MaterialState> states) {
                                    return RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.white),
                                    );
                                  }),
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return MyColors.red;
                                  }
                                  return Colors.white;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Symptoms',
                  style: TextStyle(
                    color: MyColors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 240,
                  child: PageView(
                    children: [
                      SizedBox(
                        height: 240,
                        child: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: List.generate(
                                _symptomModelsFirstList.length,
                                (index) => ChoiceChip(
                                      label: Text(_symptomModelsFirstList[index]
                                              .symptom
                                              ?.asString() ??
                                          ' '),
                                      selected: _symptomModelsFirstList[index]
                                          .isSelected,
                                      onSelected: (isSelected) =>
                                          _onSymptomSelectedFirstList(
                                              isSelected, index),
                                    ))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 240,
                        child: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: List.generate(
                                _symptomModelsSecondList.length,
                                (index) => ChoiceChip(
                                      label: Text(
                                          _symptomModelsSecondList[index]
                                                  .symptom
                                                  ?.asString() ??
                                              ' '),
                                      selected: _symptomModelsSecondList[index]
                                          .isSelected,
                                      onSelected: (isSelected) =>
                                          _onSymptomSelectedSecondList(
                                              isSelected, index),
                                    ))),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Notes',
                  style: TextStyle(
                    color: MyColors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey,
                    ),
                    onChanged: (_) => setState(() {}),
                    maxLength: 140,
                    controller: _vaccineController,
                    decoration: InputDecoration(
                      suffixText:
                          (140 - _vaccineController.text.length).toString(),
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: InputBorder.none,
                      /*
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),*/
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Type here',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Vaccine',
                  style: TextStyle(
                    color: MyColors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey,
                    ),
                    onChanged: (_) => setState(() {}),
                    maxLength: 140,
                    controller: _notesController,
                    decoration: InputDecoration(
                      suffixText:
                          (140 - _notesController.text.length).toString(),
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: InputBorder.none,
                      /*
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),*/
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Type here',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSymptomSelectedFirstList(bool isSelected, int index) {
    setState(() {
      _symptomModelsFirstList[index].isSelected = isSelected;
    });
  }

  void _onSymptomSelectedSecondList(bool isSelected, int index) {
    setState(() {
      _symptomModelsSecondList[index].isSelected = isSelected;
    });
  }
}
