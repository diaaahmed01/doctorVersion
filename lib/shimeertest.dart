import 'package:final_project/Components/colors.dart';
import 'package:final_project/Components/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Components/Appbars/AppBar.dart';

class ShimmerTest extends StatelessWidget {
  const ShimmerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
          child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    shimmerwidget(width: 60.w, height: 60.w, radius: 50),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        shimmerwidget(width: 70.w, height: 10.w),
                        SizedBox(
                          height: 2.h,
                        ),
                        shimmerwidget(width: 60.w, height: 10.w),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                shimmerwidget(height: 50.h)
              ],
            ),
          ),
        ),
        itemCount: 4,
      )),
    );
  }
}
