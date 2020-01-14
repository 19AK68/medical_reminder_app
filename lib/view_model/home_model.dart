
import 'package:flutter/material.dart';

class HomeModel  with ChangeNotifier {
  HomeModel();

  String _displayText = "";
  String mainTitle = " Press + to add a Medimcal Reminder ";
  String numberMed = '0';



  String setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
    return _displayText;
  }

  String get getDisplayText => _displayText;

}