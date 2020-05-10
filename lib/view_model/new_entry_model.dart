import 'package:flutter/material.dart';
import 'package:medical_reminder/page/model/medical_item.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';

class NewEntryModel with ChangeNotifier {
  NewEntryModel();
  MedicalItem medicalItem = MedicalItem();
  List<MedicalItem> _medicalItemList = [];
  TimeOfDay picked;
  String timeInterval;
  var intervalItem = [
    6,
    8,
    12,
    24,
  ];


  List<MedicalItem> getMedicalItem() {
    if(_medicalItemList == null) {
      _addDummyMedicalItem();
    }

    return _medicalItemList;
  }

  List<bool> _isSelected = [false, false, false, false];

  List<bool> get isSelected => _isSelected;

  // var isSelected = [false, true, false, false, false];



  var selectedInterval = 0;



  void updateSelectedMedicine(MedicineType medicineType) {
    /// fount true
    var posSelected = medicineType.index;

    var posCurrent = isSelected.indexOf(true);

    if (posCurrent >= 0) {
      if (posCurrent == posSelected) {
        isSelected[posCurrent] = !(isSelected[posCurrent]);
      } else {
        isSelected[posCurrent] = !(isSelected[posCurrent]);
        isSelected[posSelected] = !(isSelected[posSelected]);
      }
    } else {
      isSelected[posSelected] = true;
    }

    notifyListeners();
    print("posSelected " + posSelected.toString());
    print("posCurrent " + posCurrent.toString());
  }

  bool isMedicineType(MedicineType medicineType) {
    bool _isMedisineType = false;
    switch (medicineType) {
      case MedicineType.Bottle:
        _isMedisineType = true;
        break;
      case MedicineType.Pill:
        _isMedisineType = true;
        break;
      case MedicineType.Syringe:
        _isMedisineType = true;
        break;
      case MedicineType.Tablet:
        _isMedisineType = true;
        break;
      case MedicineType.None:
        _isMedisineType = true;
        break;
    }
    return _isMedisineType;
  }

  Future<TimeOfDay> selectTime(BuildContext context) async {
    TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
    bool _clicked = false;
     picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    print(' TimeOfDay picked $picked');
    return picked;
  }

  void _addDummyMedicalItem() {
    print("interval " + selectedInterval.toString());
    print("start " +   picked.toString());
    print("timeInterval " + timeInterval.toString());


  medicalItem.interval = timeInterval?? " ";
  medicalItem.startTime = picked.toString();

  print("medicalItem "  + medicalItem.toString() );


// _medicalItem.add(MedicalItem.fromMap({
//   "name": "New",
//   "dosage": "5",
//   "type": "tab",
//   "interval":selectedInterval.toString(),
//   "start":  picked.toString(),
// }));





  }
  void changeInterval(int newVal){
    selectedInterval = newVal;
    print(" newVal " + newVal.toString());
    timeInterval = selectedInterval.toString();
    notifyListeners();
    
  }
}
