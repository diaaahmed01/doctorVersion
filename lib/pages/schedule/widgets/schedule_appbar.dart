import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/color.dart';

class ScheduleAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ScheduleAppBar({
    super.key,
  });

  @override
  State<ScheduleAppBar> createState() => _ScheduleAppBarState();

  @override
  @override
  Size get preferredSize => Size(double.maxFinite, 150.h);
}

class _ScheduleAppBarState extends State<ScheduleAppBar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              // Expanded(
              //   flex: 1,
              //   child: IconButton(
              //       onPressed: () => setState(() => _resetSelectedDate()),
              //       icon: Icon(
              //         Icons.arrow_back_ios_new,
              //         size: 20.sp,
              //         color: Colors.white,
              //       )),
              // ),
              Expanded(
                // flex: 15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: CalendarTimeline(
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                    onDateSelected: (date) =>
                        setState(() => _selectedDate = date),
                    leftMargin: 20,
                    monthColor: Colors.white,
                    dayColor: const Color.fromARGB(190, 255, 255, 255),
                    dayNameColor: Colors.white,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor:
                        const Color.fromARGB(255, 24, 23, 98),
                    dotsColor: Colors.white,
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en',
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: AppColor.primaryColor,
            child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: const Color.fromARGB(152, 255, 255, 255),
                overlayColor: const MaterialStatePropertyAll(Color(0xFF6574CF)),
                indicatorColor: Colors.white,
                indicatorWeight: 4.w,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                tabs: const [
                  Tab(
                    child: Text(
                      'Appointments',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Requests',
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
