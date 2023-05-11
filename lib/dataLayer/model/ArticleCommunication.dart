// To parse this JSON data, do
//
//     final articleCommunication = articleCommunicationFromJson(jsonString);

import 'dart:convert';

import 'Doctor.dart';

// List<ArticleCommunication> articleCommunicationFromJson(String str) => List<ArticleCommunication>.from(json.decode(str).map((x) => ArticleCommunication.fromJson(x)));

// String articleCommunicationToJson(List<ArticleCommunication> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleCommunication {
  ArticleCommunication({
    this.id,
    required this.likes,
    required this.comments,
  });

  String? id;
  List<Like> likes;
  List<Comment> comments;

  factory ArticleCommunication.fromJson(Map<String, dynamic> json) =>
      ArticleCommunication(
        id: json["_id"],
        likes: List<Like>.from(json["Likes"].map((x) => Like.fromJson(x))),
        comments: List<Comment>.from(
            json["Comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Likes": List<String>.from(likes.map((x) => x)),
        "Comments": List<String>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.doctor,
    required this.content,
    required this.time,
    this.id,
  });

  Doctor? doctor;
  String content;
  String time;
  String? id;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        doctor: Doctor.fromJson(json["Doctor"]),
        content: json["Content"],
        time: json["Time"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Doctor": doctor?.toJson(),
        "Content": content,
        "Time": time,
        "_id": id,
      };
}

class Like {
  Like({
    required this.doctorId,
    required this.id,
  });

  String doctorId;
  String id;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        doctorId: json["DoctorId"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "DoctorId": doctorId,
        "_id": id,
      };
}
