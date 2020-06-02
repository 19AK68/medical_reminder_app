import 'base_model.dart';

class HomeModel extends BaseModel {
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
