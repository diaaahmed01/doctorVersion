import 'package:final_project/common/widgets/Appbars/AppBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/color.dart';

class PatientsQueue extends StatelessWidget {
  final List queuelist;
  const PatientsQueue({super.key, required this.queuelist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: myAppBar(showActionIcon: true, title: 'Queue'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(11.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${queuelist.length} patients waiting in queue',
                style: TextStyle(fontSize: 15.sp),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: queuelist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(queuelist[index]),
                                    radius: 30.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mohamed hosny',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.h),
                                          child: Text(
                                            'first visit',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Text(
                                  'Appointment starts after 20 minutes',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
