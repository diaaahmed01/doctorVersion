import 'package:final_project/dataLayer/logic/cubit/doctor_cubit.dart';
import 'package:final_project/dataLayer/model/Appointment.dart';
import 'package:final_project/test_lists.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';
import '../../../Components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../Components/shimmer.dart';
import '../widgets/appointents.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({super.key});

  @override
  State<DoctorSchedule> createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule>
    with AutomaticKeepAliveClientMixin {
  // late List<Appointment> allAppointments;
  @override
  Widget build(BuildContext context) {
    List<Appointment> appointments = TestLists()
        .testAppointments
        .where((element) => element.accepted == "true")
        .toList();

    var size = MediaQuery.of(context).size;
    double myHeight = size.height;
    double myWidth = size.width;
    return Scaffold(
      backgroundColor: MyColors().maincolor,
      body: BlocBuilder<DoctorCubit, DoctorCubitState>(
        builder: (context, state) {
          if (state is DoctorHomePageLoading) {
            return Center(
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
            //    allAppointments = state.homePage.appointments;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        AppointmentWidget(appointment: appointments[index]),
                    itemCount: appointments.length,
                  )
                ],
              ),
            );
          } else
            return Text('');
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
