import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temperature/database/temperature_data_base.dart';
import 'package:temperature/model/degree.dart';
import 'package:temperature/model/health.dart';
import 'package:temperature/model/measurement_fields.dart';
import 'package:temperature/model/symptom_model.dart';
import 'package:temperature/model/symptoms.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../custom_icons.dart';
import '../my_colors.dart';
import 'home_page.dart';

class AdditionalData extends StatefulWidget {
  AdditionalData(this.temperatureMeasurement, this.degree);

  final String temperatureMeasurement;
  final Degree degree;

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

  List<Symptoms> _listForDataBase = [];
  DateTime _dateTime = DateTime.now();
  final _notesController = TextEditingController();
  final _vaccineController = TextEditingController();

  bool _isGood = false;
  bool _isNormal = false;
  bool _isBad = false;
  Health health = Health.normal;

  final _pageController = PageController(viewportFraction: 1.0, keepPage: true);

  bool _isDateChanged = false;

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
                ]
            )
        ),
        child: SafeArea(
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
                    widget.temperatureMeasurement+ ' ' + getDegree(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  )),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isDateChanged ?
                      Text(
                        DateFormat('MMM d, HH:mm a').format(_dateTime),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ) :
                      Text(
                        'Today, ' + DateFormat.jm().format(_dateTime),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.19),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              _showDatePicker(context);
                              setState(() {
                                _isDateChanged = true;
                              });
                            },
                            icon: Icon(
                              CustomIcons.pen,
                              color: MyColors.purple,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                    ],
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
                      color: const Color(0xFFF7F7F7),
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
                                        health = Health.good;
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
                                health = Health.normal;
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
                                health = Health.bad;
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
                  const SizedBox(height: 24),
                  Text(
                    'Symptoms',
                    style: TextStyle(
                      color: MyColors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(18),
                  ),
                    height: 240,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
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
                  const SizedBox(height: 14),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 2,
                      effect: ColorTransitionEffect(
                        dotColor: MyColors.grey,
                        activeDotColor: MyColors.purple,
                        dotHeight: 14,
                        dotWidth: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Type here',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Type here',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await TemperatureDataBase.instance.create(Measurement(
                          temperature: _parseToDouble(widget.temperatureMeasurement),
                          degree: widget.degree,
                          health: health,
                          symptoms: _save(),
                          notes: _notesController.text,
                          dateTime: _dateTime,
                        ));
                        //Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
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
                  ),
                  const SizedBox(height: 25),
                ],
              ),
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

  List<Symptoms> _save() {
    for (int i = 0; i < _symptomModelsFirstList.length; i++) {
      if (_symptomModelsFirstList[i].isSelected) {
        _listForDataBase.add(_symptomModelsFirstList[i].symptom!);
      }
    }
    for (int i = 0; i < _symptomModelsSecondList.length; i++) {
      if (_symptomModelsSecondList[i].isSelected) {
        _listForDataBase.add(_symptomModelsSecondList[i].symptom!);
      }
    }
    return _listForDataBase;
  }

  String getDegree() {
    if (widget.degree == Degree.C) {
      return '°C';
    } else {
      return '°F';
    }
  }

  double _parseToDouble(String text) {
    var myDouble = double.parse(text);
    assert(myDouble is double);
    return myDouble;
  }

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _dateTime = val;
                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));
  }
}
