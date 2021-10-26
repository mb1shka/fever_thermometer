import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:temperature/model/history_element.dart';
import 'package:temperature/my_colors.dart';

import 'measurement_fields.dart';

class GroupByDateTime extends StatelessWidget{
  final List<Measurement> measurements;
  final DateTime dateTime;

  const GroupByDateTime({required this.dateTime, required this.measurements});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 12),
          child: Text(
            DateFormat("MMM d yyyy").format(dateTime),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: MyColors.grey
            ),
          ),
        ),
        ListView.builder(
          primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) => HistoryElement(measurements[index]),
          itemCount: measurements.length,
        ),
      ],
    );
  }

}