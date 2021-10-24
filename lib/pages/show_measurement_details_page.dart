import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature/model/symptoms.dart';

class ShowMeasurementDetails extends StatelessWidget {
  final String temperature;
  final String degree;
  final String health;
  final List<Symptoms> symptoms;
  final String notes;
  final String dateTime;

  ShowMeasurementDetails({
    required this.temperature,
    required this.degree,
    required this.health,
    required this.symptoms,
    required this.notes,
    required this.dateTime,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
    );
  }

}