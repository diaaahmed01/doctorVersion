import 'package:final_project/pages/schedule/screens/requests.dart';
import 'package:final_project/pages/schedule/screens/Appointments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/color.dart';
import '../widgets/schedule_appbar.dart';

class DoctorScheduleLayout extends StatefulWidget {
  const DoctorScheduleLayout({super.key});

  @override
  State<DoctorScheduleLayout> createState() => _DoctorScheduleLayoutState();
}

class _DoctorScheduleLayoutState extends State<DoctorScheduleLayout>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColor.primaryColor,
                title: Text(
                  "Schedule",
                  style: TextStyle(fontSize: 23.sp),
                ),
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                centerTitle: true,
                floating: true,
                bottom: const ScheduleAppBar(),
              )
            ];
          },
          body: const Expanded(
            child: TabBarView(children: [DoctorSchedule(), RequestsPage()]),
          ),
        ),
      ),
    );
  }
}
