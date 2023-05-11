import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../dataLayer/Data/Repository.dart';
import '../../dataLayer/model/Appointment.dart';
import '../../dataLayer/model/Article.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.repository) : super(InitialState());
  final Repository repository;
  List<Appointment> allAppointment = [];
  List<Article> allArticles = [];
}
