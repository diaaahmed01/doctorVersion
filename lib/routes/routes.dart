import 'dart:collection';

import 'package:final_project/Features/articles/screens/Drprofile.dart';
import 'package:final_project/Features/consultion/screens/report.dart';
import 'package:final_project/dataLayer/model/Appointment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Features/articles/screens/Article_detailes.dart';
import '../Features/articles/screens/Articles_page.dart';
import '../Features/consultion/screens/appointmentsdetailes.dart';
import '../Features/home/screens/waitnigqueue.dart';
import '../Features/main/mainScreens.dart';

import '../Features/articles/screens/add article.dart';

import '../Features/schedule/screens/request_details.dart';
import '../Features/settings/screens/notification.dart';
import '../Features/consultion/screens/prescription.dart';
import '../Features/profile/screens/profile.dart';
import '../Features/schedule/screens/requests.dart';
import '../Features/schedule/screens/Appointments.dart';

import 'package:flutter/material.dart';

import '../dataLayer/Data/Repository.dart';
import '../dataLayer/logic/cubit/communications_cubit.dart';
import '../dataLayer/logic/cubit/doctor_cubit.dart';
import '../dataLayer/model/Article.dart';
import '../dataLayer/model/Doctor.dart';

class AppRouter {
  final doctorCubit = DoctorCubit(Repository());
  final articleCom = CommunicationsCubit(Repository());
  final Repository myRepository = Repository();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
            value: myRepository,
            child: BlocProvider.value(
              value: doctorCubit,
              child: NavScreens(),
            ),
          ),
        );

      case '/Notifications':
        return MaterialPageRoute(
          builder: (_) => const Notifications(),
        );

      case '/AppointmentDetails':
        final appointment = routeSettings.arguments as Appointment;
        return MaterialPageRoute(
          builder: (_) => AppointmentDetails(appointment: appointment),
        );

      case '/Requests':
        return MaterialPageRoute(
          builder: (_) => const RequestsPage(),
        );

      case '/articlesPage':
        // final articles = routeSettings.arguments as List<Article>;
        return MaterialPageRoute(
          builder: (_) => ArticlesPage(
              //  allArticles: articles,
              ),
        );
      case '/RequestDetails':
        final appointment = routeSettings.arguments as Appointment;
        return MaterialPageRoute(
          builder: (_) => RequestDetails(appointment: appointment),
        );

      case '/queue':
        final queueList = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => PatientsQueue(queuelist: queueList),
        );
      case '/AddArticle':
        return MaterialPageRoute(
          builder: (_) => AddArticle(),
        );

      case '/articleDetailes':
        final article = routeSettings.arguments as Article;
        // final doctor = routeSettings.arguments as Doctor;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: articleCom,
            child: articleDetails(
              article: article,
            ),
          ),
        );

      case '/Prescription':
        return MaterialPageRoute(
          builder: (_) => Prescription(),
        );
      case '/DoctorSchedule':
        return MaterialPageRoute(
          builder: (_) => const DoctorSchedule(),
        );

      case '/myprofile':
        return MaterialPageRoute(
          builder: (_) => MyProfile(),
        );

      case '/report':
        return MaterialPageRoute(
          builder: (_) => Report(),
        );
      case '/doctorprofile':
        final doctor = routeSettings.arguments as Doctor;
        return MaterialPageRoute(
          builder: (_) => DoctorProfile(
            doctor: doctor,
          ),
        );

      default:
        return null;
    }
  }
}
