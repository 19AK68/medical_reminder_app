import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_reminder/page/model/medical_item.dart';

class DataBaseServices {
  final CollectionReference _medicineCollection =
      Firestore.instance.collection('medicines');

  final CollectionReference _medicineShedulesCollection =
      Firestore.instance.collection('medicineShedules');

  Future addOrUpdateMedicine(MedicalItem medicalItem) async {
    return await _medicineShedulesCollection.document();
  }
}
