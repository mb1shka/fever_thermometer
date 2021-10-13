import 'package:temperature/model/degree.dart';
import 'package:temperature/model/health.dart';
import 'package:temperature/model/symptoms.dart';

const String tableMeasurements = 'measurement';

class MeasurementFields {
  static final List<String> values = [
    temperature, degree, health, symptoms, notes, dateTime
  ];

  static const String temperature = 'temperature';
  static const String degree = 'degree';
  static const String health = 'health';
  static const String symptoms = 'symptoms';
  static const String notes = 'notes';
  static const String dateTime = 'dateTime';
}

class Measurement {
  final int temperature;
  final Degree degree;
  final Health health;
  final List<Symptoms> symptoms;
  final String notes;
  final DateTime dateTime;

  const Measurement({
    required this.temperature,
    required this.degree,
    required this.health,
    required this.symptoms,
    required this.notes,
    required this.dateTime
  });

  Measurement copy({
    int? temperature,
    Degree? degree,
    Health? health,
    List<Symptoms>? symptoms,
    String? notes,
    DateTime? dateTime,
  }) =>
      Measurement(
          temperature: temperature ?? this.temperature,
          degree: degree ?? this.degree,
          health: health ?? this.health,
          symptoms: symptoms ?? this.symptoms,
          notes: notes ?? this.notes,
          dateTime: dateTime ?? this.dateTime,
      );

  static Measurement fromJson(Map<String, Object?> json) => Measurement(
      temperature: json[MeasurementFields.temperature] as int,
      degree: parseDegree(json[MeasurementFields.degree] as String),
      health: parseHealth(json[MeasurementFields.health] as String),
      symptoms: parseSymptoms(json[MeasurementFields.symptoms] as String),
      notes: json[MeasurementFields.notes] as String,
      dateTime: DateTime
          .fromMillisecondsSinceEpoch(json[MeasurementFields.dateTime] as int),
  );

  static Degree parseDegree(String string) {
    switch (string) {
      case 'F':
        return Degree.F;
      case 'C':
        return Degree.C;
    }
    return Degree.C;
  }

  static Health parseHealth(String string) {
    switch (string) {
      case 'good':
        return Health.good;
      case 'normal':
        return Health.normal;
      case 'bad':
        return Health.bad;
    }
    return Health.normal;
  }

  static List<Symptoms> parseSymptoms(String string) {
    List<Symptoms> symptomsList = [];
    var values = string.split(',');
    for (int i = 0; i < values.length; i++) {
      switch (values[i]) {
        case 'soreThroat':
          symptomsList.add(Symptoms.soreThroat);
          break;
        case 'fever':
          symptomsList.add(Symptoms.fever);
          break;
        case 'dizziness':
          symptomsList.add(Symptoms.dizziness);
          break;
        case 'fatigue':
          symptomsList.add(Symptoms.fatigue);
          break;
        case 'headache':
          symptomsList.add(Symptoms.headache);
          break;
        case 'cough':
          symptomsList.add(Symptoms.cough);
          break;
        case 'runnyNose':
          symptomsList.add(Symptoms.runnyNose);
          break;
        case 'sneeze':
          symptomsList.add(Symptoms.sneeze);
          break;
        case 'nausea':
          symptomsList.add(Symptoms.nausea);
          break;
        case 'lossOfAppetite':
          symptomsList.add(Symptoms.lossOfAppetite);
          break;
        case 'musclePain':
          symptomsList.add(Symptoms.musclePain);
          break;
      }
    }
    return symptomsList;
  }

  Map<String, Object?> toJson() => {
    MeasurementFields.temperature: temperature,
    MeasurementFields.degree : degree.toString(),
    MeasurementFields.health: health.toString(),
    MeasurementFields.symptoms: symptomsArrayToString(symptoms),
    MeasurementFields.notes: notes,
    MeasurementFields.dateTime: dateTime.toUtc().millisecondsSinceEpoch,
  };

  static String symptomsArrayToString(List<Symptoms> symptoms) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < symptoms.length; i++) {
      stringBuffer.write(symptoms[i]);
      stringBuffer.write(',');
    }
    return stringBuffer.toString();
  }
}