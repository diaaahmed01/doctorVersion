import 'package:final_project/dataLayer/model/Doctor.dart';

class Article {
  Article(
      {this.id,
      this.doctor,
      this.content,
      this.date,
      this.articleCommunication,
      this.articleTitle,
      this.articleField});

  String? id;
  Doctor? doctor;
  String? content;
  String? articleField;
  String? date;
  String? articleCommunication;
  String? articleTitle;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        doctor: Doctor.fromJson(json["Doctor"]),
        content: json["Content"],
        date: json["Date"],
        articleField: json["ArticleField"],
        articleCommunication: json["ArticleCommunication"],
        articleTitle: json["ArticleTitle"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Doctor": doctor,
        "Content": content,
        "ArticleField": articleField,
        "Date": date,
        "ArticleCommunication": articleCommunication,
        "ArticleTitle": articleTitle,
      };
}
