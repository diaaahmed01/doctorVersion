// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  String id;
  String patientName;
  String patientAge;
  String patientImgUrl;

  Patient({
    required this.id,
    required this.patientName,
    required this.patientAge,
    required this.patientImgUrl,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      id: json["_id"],
      patientName: json["PatientName"],
      patientAge: json["Patient_Age"],
      patientImgUrl: json["PatientImgUrl"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "PatientName": patientName,
        "Patient_Age": patientAge,
        "PatientImgUrl": patientImgUrl
      };
}
