import 'package:flutter/material.dart';

class Pill {
  Pill(
      {this.id,
      this.pillName,
      this.dose,
      this.startDate,
      this.finishDate,
      this.pillTime,
      this.howToUse});

  String? id;
  String? pillName;
  int? dose;
  DateTime? startDate;
  DateTime? finishDate;
  TimeOfDay? pillTime;
  String? howToUse;

  factory Pill.fromJson(Map<String, dynamic> json) => Pill(
      id: json["_id"],
      pillName: json["pillName"],
      dose: json["dose"],
      startDate: json["startDate"],
      finishDate: json["finishDate"],
      pillTime: json["pillTime"],
      howToUse: json["howToUse"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pillName": pillName,
        "dose": dose,
        "startDate": startDate,
        "finishDate": finishDate,
        "pillTime": pillTime,
        "howToUse": howToUse,
      };
}
