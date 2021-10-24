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
  final double temperature;
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
    double? temperature,
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
      temperature: forceDouble(json[MeasurementFields.temperature] as num),
      degree: parseDegree(json[MeasurementFields.degree] as String),
      health: parseHealth(json[MeasurementFields.health] as String),
      symptoms: parseSymptoms(json[MeasurementFields.symptoms] as String),
      notes: json[MeasurementFields.notes] as String,
      dateTime: DateTime
          .fromMillisecondsSinceEpoch(json[MeasurementFields.dateTime] as int),
  );

  static double forceDouble(num i) {
    return i.toDouble();
  }

  static Degree parseDegree(String string) {
    switch (string) {
      case 'Degree.F':
        return Degree.F;
      case 'Degree.C':
        return Degree.C;
    }
    return Degree.C;
  }

  static Health parseHealth(String string) {
    switch (string) {
      case 'Health.good':
        return Health.good;
      case 'Health.normal':
        return Health.normal;
      case 'Health.bad':
        return Health.bad;
    }
    return Health.normal;
  }

  static List<Symptoms> parseSymptoms(String string) {
    List<Symptoms> symptomsList = [];
    var values = string.split(',');
    for (int i = 0; i < values.length; i++) {
      final symptoms = SymptomsExt.fromString(values[i]);
      if (symptoms != null) {
        symptomsList.add(symptoms);
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