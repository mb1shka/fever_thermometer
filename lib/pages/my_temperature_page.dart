import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:temperature/my_colors.dart';
import 'package:temperature/custom_icons.dart';
import 'package:temperature/pages/add_measurement_page.dart';

class MyTemperaturePage extends StatefulWidget {
  const MyTemperaturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTemperaturePageState();
}

class _MyTemperaturePageState extends State<MyTemperaturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 180,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My temperature',
                          style: TextStyle(
                            color: MyColors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CustomIcons.tab_settings,
                            color: MyColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '0',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' °F',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            color: MyColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SlidingUpPanel(
              borderRadius: BorderRadius.circular(34),
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minHeight: MediaQuery.of(context).size.height * 0.65,
              panel: Column(
                children: [
                  const SizedBox(height: 98,),
                  const Center(
                      child: Text(
                    'History',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  )),
                  const SizedBox(height: 10,),
                  const Center(
                      child: Text('You have no measurements yet.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(height: 4,),
                  const Center(
                      child: Text('Your records will appear here.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                const AddMeasurementPage(),
                            )
                        ),
                    child: const Text('+ Add',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.orange,
                      fixedSize: const Size(327, 60),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
