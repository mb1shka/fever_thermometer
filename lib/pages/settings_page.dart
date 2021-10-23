import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:temperature/custom_icons.dart';

import '../my_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isMale = false;
  bool _isFemale = false;
  bool _isOther = false;

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: MyColors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'Sex',
                    style: TextStyle(
                      color: MyColors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _isMale
                            ? null
                            : () => setState(() {
                                  _isMale = true;
                                  _isFemale = false;
                                  _isOther = false;
                                }),
                        child: const Text('Male',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              RoundedRectangleBorder>(
                                  (Set<MaterialState> states) {
                                return RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0),
                                );
                              }),
                          backgroundColor: MaterialStateProperty
                              .resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return MyColors.orange;
                              }
                              return Colors.white;
                            },
                          ),
                          fixedSize: MaterialStateProperty.resolveWith<Size>(
                                (states) => const Size(102.33, 55),
                          ),
                          foregroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.black;
                              }),
                        ),
                      ),
                      const SizedBox(width: 14.67),ElevatedButton(
                        onPressed: _isFemale
                            ? null
                            : () => setState(() {
                          _isMale = false;
                          _isFemale = true;
                          _isOther = false;
                        }),
                        child: const Text('Female',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              RoundedRectangleBorder>(
                                  (Set<MaterialState> states) {
                                return RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0),
                                );
                              }),
                          backgroundColor: MaterialStateProperty
                              .resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return MyColors.orange;
                              }
                              return Colors.white;
                            },
                          ),
                          fixedSize: MaterialStateProperty.resolveWith<Size>(
                                (states) => const Size(102.33, 55),
                          ),
                          foregroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.black;
                              }),
                        ),
                      ),
                      const SizedBox(width: 14.67),
                      ElevatedButton(
                        onPressed: _isOther
                            ? null
                            : () => setState(() {
                          _isMale = false;
                          _isFemale = false;
                          _isOther = true;
                        }),
                        child: const Text('Other',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              RoundedRectangleBorder>(
                                  (Set<MaterialState> states) {
                                return RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0),
                                );
                              }),
                          backgroundColor: MaterialStateProperty
                              .resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return MyColors.orange;
                              }
                              return Colors.white;
                            },
                          ),
                          fixedSize: MaterialStateProperty.resolveWith<Size>(
                                (states) => const Size(102.33, 55),
                          ),
                          foregroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.black;
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              color: MyColors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 55,
                            width: 160.5,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: MyColors.grey,
                              ),
                              controller: _heightController,
                              maxLength: 5,
                              decoration: InputDecoration(
                                counterStyle: const TextStyle(
                                  height: double.minPositive,
                                ),
                                counterText: "",
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(18)),
                                ),
                                border: InputBorder.none,
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter your height',
                                hintStyle: TextStyle(
                                  color: MyColors.grey,
                                  fontSize: 18,
                                ),
                                filled: true,
                                fillColor: MyColors.lightGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              color: MyColors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 55,
                            width: 171,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: MyColors.grey,
                              ),
                              controller: _weightController,
                              maxLength: 5,
                              decoration: InputDecoration(
                                counterStyle: const TextStyle(
                                  height: double.minPositive,
                                ),
                                counterText: "",
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(18)),
                                ),
                                border: InputBorder.none,
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter your weight',
                                hintStyle: TextStyle(
                                  color: MyColors.grey,
                                  fontSize: 18,
                                ),
                                filled: true,
                                fillColor: MyColors.lightGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Name',
                    style: TextStyle(
                      color: MyColors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 55,
                    width: 335,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey,
                      ),
                      controller: _nameController,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterStyle: const TextStyle(
                          height: double.minPositive,
                        ),
                        counterText: "",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(18))),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: MyColors.grey,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: MyColors.lightGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Age',
                    style: TextStyle(
                      color: MyColors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 55,
                    width: 335,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey,
                      ),
                      controller: _ageController,
                      maxLength: 3,
                      decoration: InputDecoration(
                        counterStyle: const TextStyle(
                          height: double.minPositive,
                        ),
                        counterText: "",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(18))),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Enter your age',
                        hintStyle: TextStyle(
                          color: MyColors.grey,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: MyColors.lightGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 57),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(CustomIcons.headphones,
                            size: 24,
                            color: MyColors.purple,
                          ),
                          const SizedBox(width: 13.9),
                          const Text('Support',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {  },
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
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(CustomIcons.document,
                            size: 24,
                            color: MyColors.purple,
                          ),
                          const SizedBox(width: 13.9),
                          const Text('Privacy policy',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {  },
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
