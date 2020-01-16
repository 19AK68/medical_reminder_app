import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';



class NewEntryModel with ChangeNotifier {

  NewEntryModel();

  var isSelected = [false,true,false,false,false];

  bool updateSelectedMedicine(MedicineType medicineType){

    bool _isSelected = false;
    switch (medicineType) {
      case MedicineType.Bottle:
        _isSelected = true;
        break;
      case MedicineType.Pill:
        _isSelected = true;
        break;
      case MedicineType.Syringe:
        _isSelected = true;
        break;
      case MedicineType.Tablet:
        _isSelected = true;
        break;
      case MedicineType.None:
        _isSelected = true;
        break;
    }
    notifyListeners();
    return _isSelected;


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
