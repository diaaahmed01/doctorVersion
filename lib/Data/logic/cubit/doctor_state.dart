part of 'doctor_cubit.dart';

abstract class DoctorCubitState extends Equatable {
  const DoctorCubitState();

  @override
  List<Object> get props => [];
}

class DoctorHomePageInitial extends DoctorCubitState {}

class DoctorHomePageLoading extends DoctorCubitState {}

class DoctorHomePageLoaded extends DoctorCubitState {
  final DoctorHomePage homePage;
  // List<Object> get props => [homePage];
  DoctorHomePageLoaded(this.homePage);
}
