import 'package:final_project/Components/colors.dart';
import 'package:final_project/Components/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().maincolor,
      appBar: myAppBar(
        showActionIcon: true,
        titleWidget: shimmerwidget(width: 120, height: 35.h),
        leading: shimmerwidget(width: 60.w, height: 60.w, radius: 50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              color: MyColors().secondcolor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerwidget(height: 25.h),
                      SizedBox(height: 10.h),
                      shimmerwidget(width: 100, height: 20.h),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerwidget(height: 20.h, width: 150.w),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Align(
                                widthFactor: 0.7,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white),
                                  child: shimmerwidget(
                                      width: 70.w, height: 70.w, radius: 50),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 20.h, width: 150.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 120.h),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 20.h, width: 150.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 120.h),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 20.h, width: 150.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    shimmerwidget(height: 120.h),
                    SizedBox(
                      height: 15.h,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
