import 'dart:convert';

import 'package:final_project/dataLayer/Data/webService.dart';
import 'package:final_project/dataLayer/model/Patient.dart';

import '../model/Appointment.dart';
import '../model/Article.dart';
import '../model/ArticleCommunication.dart';
import '../model/Doctor.dart';
import '../model/DoctorHomePage.dart';

class Repository {
  final WebService webService = WebService();
  //home Page Information
  Future<DoctorHomePage> getDoctorHomePageInfo(String Id) async {
    final HomePage = await webService.getDoctorHomePageInfo(Id);
    return DoctorHomePage.fromJson(HomePage);
  }

  //Doctor
  Future<Doctor> getDoctorById(String Id) async {
    final doctor = await webService.getDoctorById(Id);
    return Doctor.fromJson(doctor);
  }

  Future<bool> updateItem(String ArticleId, Doctor doctor) async {
    Map<String, dynamic> data = {
      'savedArticles': ArticleId,
    };

    bool response = await webService.updateDoctorById(data, doctor.id!);
    return response != null;
  }

  //Appointment
  Future<List<Appointment>> getAppointmentList(String Id) async {
    final appointments = await webService.getAppointmentsByDoctorId(Id);
    return appointments.map((e) => Appointment.fromJson(e)).toList();
  }

  //Articles
  Future<List<Article>> getArticleList() async {
    final articles = await webService.getArticles();
    return articles.map((e) => Article.fromJson(e)).toList();
  }

  Future<List<Article>> getDoctorArticleList(String? Id) async {
    final articles = await webService.getDoctorArtclies(Id!);
    return articles.map((e) => Article.fromJson(e)).toList();
  }

  Future<ArticleCommunication> getArticleCommunication(String? Id) async {
    print("...hello from repo...");
    final articleCommunication = await webService.getArticleCommunication(Id);
    print(articleCommunication.runtimeType);
    final result = ArticleCommunication.fromJson(articleCommunication);
    print(result.runtimeType);
    return result;
  }

  Future<bool> addComment(
      Comment comment, String? articleCommunicationId) async {
    Map<String, dynamic> data = {
      'Comments': [
        {
          'Doctor': comment.doctor?.id,
          'Content': comment.content,
          'Time': comment.time
        }
      ]
    };

    print(jsonEncode(data));

    bool response = await webService.postComment(
        articleCommunicationId, data.cast<String, dynamic>());
    return response;
  }

  Future<bool> addArticle(Article article) async {
    Map<String, dynamic> data = {
      "Doctor": article.doctor?.id,
      "Content": article.content,
      "Date": article.date,
      "ArticleTitle": article.articleTitle
    };

    print("...from addArticle Repo" + jsonEncode(data));

    bool response = await webService.postArticle(data.cast<String, dynamic>());
    return response;
  }

  Future<Article> getArticle(String Id) async {
    final article = await webService.getArticleById(Id);
    return Article.fromJson(article);
  }

  Future<bool> addLike(String Id, Doctor doctor) async {
    Map<String, dynamic> data = {
      'Likes': [
        {
          'DoctorId': doctor.id,
        }
      ]
    };

    bool response = await webService.likeArticle(Id, data);
    return response;
  }

  Future<Patient> getPatientById(String Id) async {
    final result = await webService.getPatientById(Id);
    return Patient.fromJson(result);
  }
}
