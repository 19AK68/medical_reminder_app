import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class MedicalItem {
  String name;
  String dosage;
  String type;
  String interval;
  String startTime;

  MedicalItem(
      {this.name, this.dosage, this.type, this.interval, this.startTime});


  String get getName => name;
  String get getDosage => dosage;
  String get getType => type;
  String get getInterval => interval;
  String get getStartTime => startTime;

  factory MedicalItem.fromJson(String str) => MedicalItem.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "name": this.name,
    "dosage": this.dosage,
    "type": this.type,
    "interval": this.interval,
    "start": this.startTime,

  };

  factory MedicalItem.fromMap(Map<String, dynamic> json) => new MedicalItem(
    name: json['name'],
    dosage: json['dosage'],
    type: json['type'],
    interval: json['interval'],
    startTime: json['start'],
  );

  /*Map<String, dynamic> toJson() {
    return {

      "name": this.name,
      "dosage": this.dosage,
      "type": this.type,
      "interval": this.interval,
      "start": this.startTime,
    };
  }

  factory  MedicalItem .fromJson(Map<String, dynamic> parsedJson) {
    return MedicalItem(

      name: parsedJson['name'],
      dosage: parsedJson['dosage'],
      type: parsedJson['type'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
    );
  }
*/
}
