import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_icons.dart';
import '../my_colors.dart';

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
                  ]
              )
          ),
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
                      Icon(CustomIcons.temperature,
                        size: 20,
                        color: MyColors.orange,
                      ),
                      const SizedBox(width: 6),
                      const Text('My normal temperature is',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        height: 53,
                        width: 93,
                        child: TextField(
                          onEditingComplete: () => setState(() {
                            _controller.text = _controller.text
                                .replaceAllMapped(RegExp(r'(\d\d)(\d)'), (match) {
                              return '${match.group(1)}.${match.group(2)}';
                            });
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context).requestFocus(FocusNode());
                          }),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          ),
                          controller: _controller,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}