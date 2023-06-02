import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Data/model/Appointment.dart';
import '../../../common/style/color.dart';

// ignore: camel_case_types, must_be_immutable
class appointmentRequests extends StatelessWidget {
  appointmentRequests({super.key, required this.appointment});
  Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/RequestDetails', arguments: appointment);
      },
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: List.filled(
                  1,
                  BoxShadow(
                      blurRadius: 9.w,
                      spreadRadius: 1.w,
                      color: const Color.fromARGB(255, 221, 221, 221))),
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(5.w)),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.sp,
                      backgroundImage:
                          NetworkImage(appointment.patient!.patientImgUrl),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.patient!.patientName,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            appointment.patient!.patientAge,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: List.filled(
                          1,
                          BoxShadow(
                              blurRadius: 10.w, color: AppColor.primaryColor)),
                      color: AppColor.primaryColor
                      //  Color.fromRGBO(79, 90, 162, 1)
                      ,
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '${appointment.appointmentDate!.day},${DateFormat('MMMM').format(appointment.appointmentDate!)} ${appointment.appointmentTime}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
