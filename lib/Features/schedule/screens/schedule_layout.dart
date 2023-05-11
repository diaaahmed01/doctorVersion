import 'package:final_project/Components/Appbars/AppBar.dart';
import 'package:final_project/Features/schedule/screens/requests.dart';
import 'package:final_project/Features/schedule/screens/Appointments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Components/colors.dart';
import '../widgets/schedule_appbar.dart';

class DoctorScheduleLayout extends StatefulWidget {
  DoctorScheduleLayout({super.key});

  @override
  State<DoctorScheduleLayout> createState() => _DoctorScheduleLayoutState();
}

class _DoctorScheduleLayoutState extends State<DoctorScheduleLayout>
    with TickerProviderStateMixin {
  TabController? _tabController;

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
                backgroundColor: MyColors().secondcolor,
                title: Text(
                  AppLocalizations.of(context)!.schedule,
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
