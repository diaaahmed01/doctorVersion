import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/logic/cubit/doctor_cubit.dart';
import '../../../Data/model/Appointment.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../common/style/color.dart';
import '../../../common/widgets/shimmer.dart';
import '../../../test/test_lists.dart';
import '../widgets/appointents.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({super.key});

  @override
  State<DoctorSchedule> createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Appointment> appointments = TestLists()
        .testAppointments
        .where((element) => element.accepted == "true")
        .toList();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocBuilder<DoctorCubit, DoctorCubitState>(
        builder: (context, state) {
          if (state is DoctorHomePageLoading) {
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
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
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        AppointmentWidget(appointment: appointments[index]),
                    itemCount: appointments.length,
                  )
                ],
              ),
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
