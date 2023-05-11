import 'dart:convert';

import 'Appointment.dart';
import 'Article.dart';
import 'Doctor.dart';

class DoctorHomePage {
  DoctorHomePage({
    this.doctor,
    required this.appointments,
    required this.articles,
  });

  Doctor? doctor;
  List<Appointment> appointments;
  List<Article> articles;

  factory DoctorHomePage.fromJson(Map<String, dynamic> json) => DoctorHomePage(
        doctor: Doctor.fromJson(json["doctor"]),
        appointments: List<Appointment>.from(
            json["appointments"].map((x) => Appointment.fromJson(x))),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctor": doctor!.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
