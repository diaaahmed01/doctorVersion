import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../../../Data/model/Appointment.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key, required this.appointment});
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/AppointmentDetails',
            arguments: appointment);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      appointment.appointmentTime!,
                      style: TextStyle(
                          color: Color.fromARGB(163, 0, 0, 0),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 202, 201, 201),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 202, 201, 201),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 202, 201, 201),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 202, 201, 201),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Text(
                      appointment.appointmentTime!,
                      style: TextStyle(
                          color: Color.fromARGB(164, 0, 0, 0),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15.w,
                ),
                CircleAvatar(
                  // backgroundColor: Colors.black

                  backgroundImage:
                      NetworkImage(appointment.patient!.patientImgUrl),
                  radius: 30.sp,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.patient!.patientName,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      appointment.patient!.patientAge,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat,
                    color: Color.fromRGBO(101, 116, 207, 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
