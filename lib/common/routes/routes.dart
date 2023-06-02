import 'package:final_project/pages/articles/screens/Drprofile.dart';
import 'package:final_project/pages/consultion/screens/report.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/logic/cubit/communications_cubit.dart';
import '../../Data/logic/cubit/doctor_cubit.dart';
import '../../Data/model/Appointment.dart';
import '../../Data/model/Article.dart';
import '../../Data/model/Doctor.dart';
import '../../Data/repositroy/Repository.dart';
import '../../pages/articles/screens/Article_detailes.dart';
import '../../pages/articles/screens/Articles_page.dart';
import '../../pages/consultion/screens/appointmentsdetailes.dart';
import '../../pages/home/screens/waitnigqueue.dart';
import '../../pages/home/screens/mainScreens.dart';

import '../../pages/articles/screens/add article.dart';

import '../../pages/schedule/screens/request_details.dart';
import '../../pages/settings/screens/notification.dart';
import '../../pages/consultion/screens/prescription.dart';
import '../../pages/profile/screens/profile.dart';
import '../../pages/schedule/screens/requests.dart';
import '../../pages/schedule/screens/Appointments.dart';

import 'package:flutter/material.dart';

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
