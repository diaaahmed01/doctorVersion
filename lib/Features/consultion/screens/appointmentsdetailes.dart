import 'package:final_project/Components/Appbars/AppBar.dart';
import 'package:final_project/dataLayer/model/Appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Components/colors.dart';
import '../../../Components/defaultbutton.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({super.key, required this.appointment});
  final Appointment appointment;

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().maincolor,
      appBar: myAppBar(
        title: 'Details',
        showActionIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: MyColors().secondcolor,
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(17.w),
                  child: Row(
                    children: [
                      Container(
                        height: 60.w,
                        width: 60.w,
                        decoration: BoxDecoration(
                            boxShadow: List.filled(
                                1,
                                BoxShadow(
                                    spreadRadius: 1.w,
                                    blurRadius: 12.w,
                                    color: Color.fromARGB(255, 71, 70, 184))),
                            borderRadius: BorderRadius.circular(20.w),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                    .appointment.patient!.patientImgUrl))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.appointment.patient!.patientName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17.sp),
                            ),
                            Text(
                              widget.appointment.patient!.patientAge,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 217, 216, 216),
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 7.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                color: Color.fromARGB(187, 18, 28, 74)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.chat_bubble_text,
                                  color: MyColors().secondcolor,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            1,
                            BoxShadow(
                                spreadRadius: 1.w,
                                blurRadius: 12.w,
                                color: Color.fromARGB(255, 71, 70, 184))),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.w)),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 15.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black,
                            size: 25.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${widget.appointment.appointmentDate!.day}, ${DateFormat('MMMM').format(widget.appointment.appointmentDate!)}  ${widget.appointment.appointmentTime}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
              child: Row(
                children: [
                  Text(
                    'Patient\'s request',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: List.filled(
                      1,
                      BoxShadow(
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                          color: Color.fromARGB(91, 68, 64, 167))),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.appointment.pateintRequest!,
                      style: TextStyle(
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            ButtonOutLined(
              onPressed: () async {
                DateTime? finishDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2024));
                if (finishDate != null) {
                  setState(() {
                    // _enddateController.text =
                    //     DateFormat('MM, dd').format(finishDate);
                  });
                }
              },
              text: 'Rescedule',
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
