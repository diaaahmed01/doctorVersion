import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/dataLayer/model/Article.dart';
import 'package:final_project/dataLayer/model/Doctor.dart';

import '../../Data/Repository.dart';
import '../../model/DoctorHomePage.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorCubitState> {
  DoctorCubit(this.repository) : super(DoctorHomePageInitial());
  final Repository repository;
  late Doctor doctor;
  getDoctorHomePage() async {
    late final DoctorHomePage doctorData;
    emit(DoctorHomePageLoading());

    doctorData =
        await repository.getDoctorHomePageInfo('644720ec6b72f3ad6db85f19');
    doctor = doctorData.doctor!;
    emit(DoctorHomePageLoaded(doctorData));

    return doctorData;
  }
}
