import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

@JsonSerializable()
class ProfileDetails {

  final String name;
  final String email;

  ProfileDetails({

    this.name,
    this.email,
  });

  String toJson() => json.encode(toMap());
  factory ProfileDetails.fromJson(String str) =>
      ProfileDetails.fromMap(json.decode(str));





  factory ProfileDetails.fromMap(Map<String, dynamic> json) =>
      ProfileDetails(
        name: json["name"],
        email: json["e-mail"],
      );



  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "e-mail": email,
    };
  }
}
