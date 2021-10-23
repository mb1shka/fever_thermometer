import 'package:flutter/cupertino.dart';

class SettingsListener with ChangeNotifier{
  bool _isMale = false;
  bool _isFemale = false;
  bool _isOther = false;/*
  String heightHintText = 'Enter your height';
  String weightHintTex = 'Enter your weight';
  String nameHintTex = 'Enter your name';
  String ageHintText = 'Enter your age';*/

  bool get getMale => _isMale;
  bool get getFemale => _isFemale;
  bool get getOther => _isOther;/*
  String get getHeight => heightHintText;
  String get getWeight => weightHintTex;
  String get getName => nameHintTex;
  String get getAge => ageHintText;*/

  void changeForMale() {
    _isMale = true;
    _isFemale = false;
    _isOther = false;
    notifyListeners();
  }

  void changeForFemale() {
    _isMale = false;
    _isFemale = true;
    _isOther = false;
    notifyListeners();
  }

  void changeForOther() {
    _isMale = false;
    _isFemale = false;
    _isOther = true;
    notifyListeners();
  }
/*
  void changeHeight(String text) {
    heightHintText = text;
    notifyListeners();
  }*/


}