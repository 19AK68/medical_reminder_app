import 'package:flutter/material.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';

class NewEntryModel with ChangeNotifier {
  NewEntryModel();

  List<bool> _isSelected = [false, false, false, false];

  List<bool> get isSelected => _isSelected;

  // var isSelected = [false, true, false, false, false];

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


}
