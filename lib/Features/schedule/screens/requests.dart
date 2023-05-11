import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';
import '../../../Components/shimmer.dart';
import '../../../dataLayer/logic/cubit/doctor_cubit.dart';
import '../../../dataLayer/model/Appointment.dart';
import '../../../test_lists.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../Components/colors.dart';
import '../widgets/request.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    List<Appointment> appointments = TestLists()
        .testAppointments
        .where((element) => element.accepted == "false")
        .toList();

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: MyColors().maincolor,
          child: BlocBuilder<DoctorCubit, DoctorCubitState>(
              builder: (context, state) {
            if (state is DoctorHomePageLoading) {
              Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: shimmerwidget(height: 120.h),
                  ),
                  itemCount: 4,
                ),
              );
            }
            if (state is DoctorHomePageLoaded) {
              return buildLoadedListWidgets(appointments: appointments);
            } else
              return CircularProgressIndicator();
          })),
    ));
  }

  Widget buildLoadedListWidgets({required List<Appointment> appointments}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: PageScrollPhysics(),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return appointmentRequests(
            appointment: appointments[index],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
