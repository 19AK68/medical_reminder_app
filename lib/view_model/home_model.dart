import 'package:medical_reminder/page/model/medical_card.dart';
import 'package:medical_reminder/page/model/medical_item.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  HomeModel();
  final List<String> medList = ["Panadol","Nemicil", "Vitamim C", "Karvalol"];



  final List<MedicalCard> medicalCard = [
    MedicalCard('Panadol','5' , MedicineType.Pill, "4", DateTime.now()),
    MedicalCard('Nemicil','2' , MedicineType.Pill, "6", DateTime.now()),
    MedicalCard('Vitamim C','500' , MedicineType.Bottle, "8", DateTime.now()),
    MedicalCard('Karvalol ','20' , MedicineType.Tablet, "10", DateTime.now()),
  ];

  int iconValue (MedicineType type){
    int _iconValue = 0;

    if(type == MedicineType.Bottle){
      _iconValue = 0xe900;
    }
    else if(type == MedicineType.Pill){

    _iconValue = 0xe901;
    }
    else if(type == MedicineType.Syringe){
    _iconValue = 0xe902;

    }
    else if (type == MedicineType.Tablet) {
    _iconValue = 0xe903;
    }

    return _iconValue;
  }

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
