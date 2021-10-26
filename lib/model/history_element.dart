import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:temperature/custom_icons.dart';
import 'package:temperature/pages/show_measurement_details_page.dart';

import '../my_colors.dart';
import 'measurement_fields.dart';

const String tableMeasurements = 'measurement';

class HistoryElement extends StatelessWidget {
  final Measurement measurement;

  const HistoryElement(this.measurement);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      decoration: BoxDecoration(
        color: MyColors.lightGrey,
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 8, 34),
            child: SvgPicture.asset('assets/svg/clock.svg'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 34, 14, 34),
            child: Text(DateFormat.jm().format(measurement.dateTime)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 10, 33),
            child: SvgPicture.asset('assets/svg/min_temperature.svg'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 5, 31),
            child: Text(measurement.temperature.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 29,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 10, 30),
            child: Text('°' + measurement.degree.toString().substring(7),
              style: TextStyle(
                color: MyColors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ShowMeasurementDetails(
                      temperature: measurement.temperature.toString(),
                      degree: measurement.degree.toString(),
                      health: measurement.health,
                      symptoms: measurement.symptoms,
                      notes: measurement.notes,
                      dateTime: measurement.dateTime,
                      // measurement.dateTime,
                    ),
                  )
              ),
              style: ElevatedButton.styleFrom(
                primary: MyColors.lightGrey,
                fixedSize: const Size(53, 53),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              child: Icon(
                CustomIcons.disclosure,
                color: MyColors.grey,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}