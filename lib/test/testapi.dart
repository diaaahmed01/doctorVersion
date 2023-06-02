import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Data/model/Article.dart';
import '../Data/model/ArticleCommunication.dart';
import '../Data/model/Doctor.dart';
import '../Data/repositroy/Repository.dart';

class TestingApi {
  Repository repo = Repository();
  TestingApi();

  getDoctorById() async {
    print("... Doctor Data ...");
    final result = await repo.getDoctorById("644720ec6b72f3ad6db85f19");
    if (kDebugMode) {
      print("...Doctor Data...");
      print('Doctor name:${result.doctorName}');
      print('about Doctor:${result.aboutDoctor}');
      print('doctorSpecialty:${result.doctorSpeciality}');
      print('experienceYears:${result.experienceYears}');
      print('location:${result.location}');
      print('doctorImage:${result.doctorImage}');
      print('rank:${result.rank}');
    }
  }

  asyncLoadAllData() async {
    print("... hello from asyncLoadAllData ...");
    final result = await repo.getDoctorHomePageInfo("644720ec6b72f3ad6db85f19");
    if (kDebugMode) {
      print("...Doctor Data...");
      print('Doctor name:${result.doctor!.doctorName}');
      print('about Doctor:${result.doctor!.aboutDoctor}');
      print('doctorSpecialty:${result.doctor!.doctorSpeciality}');
      print('experienceYears:${result.doctor!.experienceYears}');
      print('location:${result.doctor!.location}');
      print('doctorImage:${result.doctor!.doctorImage}');
      print('rank:${result.doctor!.rank}');

      print("...Appointment Data...");
      result.appointments.forEach((element) {
        print('patient name:${element.patient}');
        print('appointmentDate:${element.appointmentDate}');
        print('appointmentTime:${element.appointmentTime}');
        print('patientRequest:${element.pateintRequest}');
      });
      print("...Article Data...");
      result.articles.forEach((element) {
        print('articleTitle:${element.articleTitle}');
        print('content:${element.content}');
        print('doctor:${element.doctor}');
        print('date:${element.date}');
        print('articleCommunication:${element.articleCommunication}');
      });
    }
  }

  addComment() async {
    //Doctor who made comment
    Doctor doctor = await repo.getDoctorById("644720ec6b72f3ad6db85f19");
    print("...Doctor Data...");
    print('Doctor name:${doctor.doctorName}');
    print('about Doctor:${doctor.aboutDoctor}');
    print('doctorSpecialty:${doctor.doctorSpeciality}');
    print('experienceYears:${doctor.experienceYears}');
    print('location:${doctor.location}');
    print('doctorImage:${doctor.doctorImage}');
    print('rank:${doctor.rank}');
    print('DoctorId:${doctor.id}');
    //Comment of the Doctor
    Comment comment = Comment(
        doctor: doctor,
        content: 'Hosneyyyyyyyyyyyyyyyy',
        time: 'timeeeeeeeeeeeeeeeeeee');

    //The Article that Doctor made comment on it
    Article element = await repo.getArticle("644720ec6b72f3ad6db85f19");
    print("...Article Data...");
    print('articleTitle:${element.articleTitle}');
    print('content:${element.content}');
    print('doctor:${element.doctor}');
    print('date:${element.date}');
    print('articleCommunication:${element.articleCommunication}');
    print(element.articleCommunication.runtimeType);
    //adding comment method
    await repo.addComment(comment, element.articleCommunication.toString());
    final result =
        await repo.getArticleCommunication(element.articleCommunication);
    result.comments.forEach((element) {
      print(element.content);
    });
  }

  addLike() async {
    Doctor doctor = await repo.getDoctorById("644720ec6b72f3ad6db85f19");
    print("...Doctor Data...");
    print('Doctor name:${doctor.doctorName}');
    print('about Doctor:${doctor.aboutDoctor}');
    print('doctorSpecialty:${doctor.doctorSpeciality}');
    print('experienceYears:${doctor.experienceYears}');
    print('location:${doctor.location}');
    print('doctorImage:${doctor.doctorImage}');
    print('rank:${doctor.rank}');
    print('DoctorId:${doctor.id}');

    //The Article that Doctor made comment on it
    Article element = await repo.getArticle("644720ec6b72f3ad6db85f19");
    print("...Article Data...");
    print('articleTitle:${element.articleTitle}');
    print('content:${element.content}');
    print('doctor:${element.doctor}');
    print('date:${element.date}');
    print('articleCommunication:${element.articleCommunication}');
    print(element.articleCommunication.runtimeType);

    await repo.addLike(element.articleCommunication!, doctor);
  }

  addArticle() async {
    // Doctor doctor = await repo.getDoctorById("644720ec6b72f3ad6db85f19");
    // Article article = Article(
    //     articleTitle: 'www',
    //     content: 'content',
    //     doctor: doctor,
    //     date: DateTime.now().toString());
    //final doctorArticle = await repo.addArticle(article);

    final element = await repo.getArticleList();
    print("...Article Data...");

    element.forEach((element) {
      print('articleTitle:${element.articleTitle}');
      print('content:${element.content}');
      print('doctor:${element.doctor}');
      print('date:${element.date}');
      print('articleCommunication:${element.articleCommunication}');
      print(element.articleCommunication.runtimeType);
    });
  }

  getPatient() async {
    final result = await repo.getPatientById("6447230b6b72f3ad6db85f27");
    print(result.patientName);
  }

  getArticle() async {
    final result = await repo.getDoctorArticleList("644720ec6b72f3ad6db85f19");
    print(result);
  }
}

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 1, 59),
      appBar: AppBar(title: Text('test')),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            //TestingApi().addArticle();
            TestingApi().addArticle();

            //TestingApi().getPatient();
            // Repository().getArticleList();
            //   Repository().getDoctorHomePageInfo("64448d207c658dbddf7d4f2e");
          },
          child: Text(
            'Test!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
