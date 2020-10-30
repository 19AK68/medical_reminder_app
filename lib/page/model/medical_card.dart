import 'package:medical_reminder/util/enums/medicine_type.dart';

class MedicalCard {
  final String name;
  final String dosage;
  final MedicineType type;
  final String interval;
  final DateTime startTime;
  bool isAlarm = false;

  MedicalCard(this.name, this.dosage, this.type, this.interval, this.startTime, this.isAlarm);

}

