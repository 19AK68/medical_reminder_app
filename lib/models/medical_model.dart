import 'package:flutter/cupertino.dart';

class Medical {
  final String medId;
  final List<dynamic> notificationIDs;
  final String medicineName;
  final int dosage;
  final String medicineType;
  final int interval;
  final String startTime;

  Medical({
    this.notificationIDs,
    this.medicineName,
    this.dosage,
    this.medicineType,
    this.startTime,
    this.interval,
    @required this.medId
  });

  String get getName => medicineName;
  int get getDosage => dosage;

  String get getType => medicineType;
  int get getInterval => interval;
  String get getStartTime => startTime;
  List<dynamic> get getIDs => notificationIDs;

  Map<String, dynamic> toJson() {
    return {
      "ids": this.notificationIDs,
      "name": this.medicineName,
      "dosage": this.dosage,
      "type": this.medicineType,
      "interval": this.interval,
      "start": this.startTime,
      "medId":this.medId,
    };
  }

  factory Medical.fromJson(Map<String, dynamic> parsedJson) {
    return Medical(
      notificationIDs: parsedJson['ids'],
      medicineName: parsedJson['name'],
      dosage: parsedJson['dosage'],
      medicineType: parsedJson['type'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
      medId: parsedJson['medId'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      "ids": notificationIDs,
      "name": medicineName,
      "dosage": dosage,
      "type": medicineType,
      "interval": interval,
      "start": startTime,
      "medId":medId,};

    }
  }

