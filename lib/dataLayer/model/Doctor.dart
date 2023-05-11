import 'Article.dart';

class Doctor {
  Doctor(
      {this.id,
      this.doctorName,
      this.doctorSpeciality,
      this.rank,
      this.location,
      this.experienceYears,
      this.aboutDoctor,
      this.doctorImage});

  String? id;
  String? doctorName;
  String? doctorSpeciality;
  String? rank;
  String? location;
  String? experienceYears;
  String? aboutDoctor;
  String? doctorImage;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        doctorName: json["doctorName"],
        rank: json["Rank"],
        doctorImage: json["doctorImgUrl"],
        doctorSpeciality: json["doctorSpeciality"],
        location: json["location"],
        experienceYears: json["experience_years"],
        aboutDoctor: json["about_doctor"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Rank": rank,
        "doctorName": doctorName,
        "doctorImgUrl": doctorImage,
        "doctorSpeciality": doctorSpeciality,
        "location": location,
        "experience_years": experienceYears,
        "about_doctor": aboutDoctor,
      };
}
