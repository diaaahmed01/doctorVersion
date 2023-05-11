import 'package:final_project/dataLayer/model/Patient.dart';

class Appointment {
  Appointment(
      {this.id,
      this.patient,
      this.appointmentDate,
      this.appointmentTime,
      this.pateintRequest,
      this.accepted});

  String? id;
  Patient? patient;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? pateintRequest;
  String? accepted;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
      id: json["_id"],
      patient: Patient.fromJson(json["Patient"]),
      appointmentDate: DateTime.parse(json["AppointmentDate"]),
      appointmentTime: json["AppointmentTime"],
      pateintRequest: json["PateintRequest"],
      accepted: json["Accepted"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Patient": patient,
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "AppointmentTime": appointmentTime,
        "PateintRequest": pateintRequest,
        "Accepted": accepted
      };
}
