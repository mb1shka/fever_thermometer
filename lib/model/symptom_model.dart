import 'package:temperature/model/symptoms.dart';

class SymptomModel {

  SymptomModel({
    this.symptom,
    this.isSelected = false,
  });

  Symptoms? symptom;
  bool isSelected;

}