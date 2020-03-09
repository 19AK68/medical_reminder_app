import 'package:flutter/material.dart';
import 'package:medical_reminder/page/model/medical_item.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';

class NewEntryModel with ChangeNotifier {
  NewEntryModel();

  List<MedicalItem> medicalItem;

  Future<List<MedicalItem>> getNotifications() {
    return medicalItem ??
        () {
          if (medicalItem.isEmpty) {
            _addDummyMedicalItem();
          }
        };
  }

  List<bool> _isSelected = [false, false, false, false];

  List<bool> get isSelected => _isSelected;

  // var isSelected = [false, true, false, false, false];

  var interval = [
    6,
    8,
    12,
    24,
  ];

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
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    print(' TimeOfDay picked $picked');
    return picked;
  }

  void _addDummyMedicalItem() {
  //  medicalItem.add(value)
  }
}
