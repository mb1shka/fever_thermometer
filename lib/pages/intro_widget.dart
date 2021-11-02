import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../my_colors.dart';

class IntroWidget extends StatelessWidget {

  IntroWidget({
    required this.title,
    required this.description,
    required this.svgPicture,
    required this.onNext,
    required this.height,
});

  final String title;
  final String description;
  final String svgPicture;
  final VoidCallback onNext;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height,),
          SvgPicture.asset(svgPicture),
          const SizedBox(height: 26,),
          Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8,),
          Text(description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 39,),
          ElevatedButton(
            onPressed: onNext,
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: MyColors.orange,
                fixedSize: const Size(327, 60),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )),
          )
        ],
      ),
    );
  }

}