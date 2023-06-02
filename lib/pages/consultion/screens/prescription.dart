import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';
import '../../../common/widgets/defaultbutton.dart';
import 'addpill.dart';

class Prescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const myAppBar(
        title: 'PRESCRIPTION',
        showActionIcon: true,
      ),
      body: Container(
        color: AppColor.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.h),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/OIP.m1peyYpjVFWtvagCzlzhzAHaFj?pid=ImgDet&rs=1'),
                    ),
                    Text(
                      'Saad Mustafa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, vertical: 12.0.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add Medicine',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0.sp),
                        )),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddPill()));
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                height: 60.0.h,
                width: 340.w,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage('assets/medicine.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w, vertical: 4.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Asprin',
                              style: TextStyle(
                                  fontSize: 20.0.sp, color: Colors.black),
                            ),
                            Text(
                              'One Cappsule After Dinner',
                              style: TextStyle(
                                  fontSize: 14.0.sp, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Container(
                height: 60.0.h,
                width: 340.w,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage('assets/medicine.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w, vertical: 4.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Asprin',
                              style: TextStyle(
                                  fontSize: 20.0.sp, color: Colors.black),
                            ),
                            Text(
                              'One Cappsule After Dinner',
                              style: TextStyle(
                                  fontSize: 14.0.sp, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 12.0.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add Activites',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0.sp),
                        )),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.0.h,
                width: 340.w,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage('assets/x-ray.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w, vertical: 12.0.h),
                        child: Text(
                          'X-Ray',
                          style:
                              TextStyle(fontSize: 20.0.sp, color: Colors.black),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 12.0.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Next Appointment Date',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0.sp),
                        )),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                height: 60.0.h,
                width: 340.w,
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
                  child: Row(children: [
                    Column(
                      children: [
                        Text(
                          '14-Oct-2023',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.meeting_room,
                              color: AppColor.primaryColor,
                            ),
                            Text(
                              'Office Visit',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: AppColor.primaryColor,
                        )),
                  ]),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ButtonOutLined(
                onPressed: () {
                  Navigator.pushNamed(context, '/report');
                },
                text: 'Add report',
              )
            ],
          ),
        ),
      ),
    );
  }
}
