import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:temperature/database/temperature_data_base.dart';
import 'package:temperature/model/group_by_date_time.dart';
import 'package:temperature/model/history_element.dart';
import 'package:temperature/model/measurement_fields.dart';

import '../custom_icons.dart';
import '../my_colors.dart';

typedef MeasurementGroupByDate = List<MeasurementBatch>;

class MeasurementBatch {
  final DateTime date;
  final List<Measurement> measurements;

  MeasurementBatch(this.date, this.measurements);
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                MyColors.blandPurple,
                const Color(0xFFFFFFFF),
              ])),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: Text(
                    'My logs',
                    style: TextStyle(
                      color: MyColors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 20, 0),
                  child: Row(
                    children: [
                      Icon(
                        CustomIcons.temperature,
                        size: 20,
                        color: MyColors.orange,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'My normal temperature is',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: SizedBox(
                          height: 53,
                          width: 93,
                          child: TextField(
                            onEditingComplete: () => setState(() {
                              _controller.text = _controller.text
                                  .replaceAllMapped(RegExp(r'(\d\d)(\d)'),
                                      (match) {
                                return '${match.group(1)}.${match.group(2)}';
                              });
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context).requestFocus(FocusNode());
                            }),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            controller: _controller,
                            maxLength: 5,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              border: InputBorder.none,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: '00.0 °',
                              hintStyle: TextStyle(
                                color: MyColors.grey,
                                fontSize: 25,
                              ),
                              filled: true,
                              fillColor: MyColors.lightGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: FutureBuilder<MeasurementGroupByDate>(
                      future: //TemperatureDataBase.instance.readAll(),
                      getHistoryElementsGroupByDate(),
                      // меняю на другую функцию, которая будет так же выгружать все из базы данных,
                        //но она будет создавать мапу
                      builder: (BuildContext context, AsyncSnapshot<MeasurementGroupByDate> snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                            GroupByDateTime(dateTime: snapshot.data![index].date, measurements: snapshot.data![index].measurements),
                            itemCount: snapshot.data!.length,
                          );
                        }
                        return const SizedBox();
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<MeasurementGroupByDate> getHistoryElementsGroupByDate() async {
    MeasurementGroupByDate measurementGroupByDate = [];
    var measurements = await TemperatureDataBase.instance.readAll();

    DateTime? dateTime;
    for (final measurement in measurements) {
      if (dateTime == null || !dateTime.isSameDate(measurement.dateTime)) {
        dateTime = measurement.dateTime;
        measurementGroupByDate.add(MeasurementBatch(measurement.dateTime, [measurement]));
        continue;
      }
      measurementGroupByDate.last.measurements.add(measurement);
    }
    return measurementGroupByDate;
  }
}
