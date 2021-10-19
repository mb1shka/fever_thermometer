import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:temperature/model/symptom_model.dart';
import 'package:temperature/model/symptoms.dart';
import 'dart:math' as math;

import '../custom_icons.dart';
import '../my_colors.dart';

class AdditionalData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdditionalDataState();
}

class _AdditionalDataState extends State<AdditionalData> {

  final List <SymptomModel> _symptomModelsFirstList = [
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
  final List <SymptomModel> _symptomModelsSecondList = [
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

  final List<SymptomModel> _symptomModels = List.generate(
      Symptoms.values.length,
      (index) => SymptomModel(symptom: Symptoms.values[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            SizedBox(
              height: 350,
              child: PageView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 350,
                    child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: List.generate(
                            _symptomModelsFirstList.length,
                                (index) => ChoiceChip(
                              label: Text(
                                  _symptomModelsFirstList[index].symptom?.asString() ?? ' '),
                              selected: _symptomModelsFirstList[index].isSelected,
                              onSelected: (isSelected) =>
                                  _onSymptomSelectedFirstList(isSelected, index),
                            ))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 350,
                    child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: List.generate(
                            _symptomModelsSecondList.length,
                                (index) => ChoiceChip(
                              label: Text(
                                  _symptomModelsSecondList[index].symptom?.asString() ?? ' '),
                              selected: _symptomModelsSecondList[index].isSelected,
                              onSelected: (isSelected) =>
                                  _onSymptomSelectedSecondList(isSelected, index),
                            ))),
                  ),
                ],
              ),
            ),
          ],
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
