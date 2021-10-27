import 'package:flutter/cupertino.dart';
import 'package:temperature/main.dart';

class SettingsListener with ChangeNotifier {
  SettingsListener() {
    switch (prefs.getInt('sex')) {
      case 0:
        _isMale = true;
        break;
      case 1:
        _isFemale = true;
        break;
      case 2:
        _isOther = true;
        break;
    }
  }

  bool _isMale = false;
  bool _isFemale = false;
  bool _isOther = false;

  bool get getMale => _isMale;
  bool get getFemale => _isFemale;
  bool get getOther => _isOther;

  void changeForMale() {
    _isMale = true;
    _isFemale = false;
    _isOther = false;
    notifyListeners();
    prefs.setInt('sex', 0);
  }

  void changeForFemale() {
    _isMale = false;
    _isFemale = true;
    _isOther = false;
    notifyListeners();
    prefs.setInt('sex', 1);
  }

  void changeForOther() {
    _isMale = false;
    _isFemale = false;
    _isOther = true;
    notifyListeners();
    prefs.setInt('sex', 2);
  }
}
