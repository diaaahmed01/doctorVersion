import 'package:final_project/common/widgets/Appbars/AppBar.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/color.dart';
import '../../../common/widgets/defaultbutton.dart';
import '../../../common/widgets/textformfeilds/defaultTextformfeild.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController diagnoseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: myAppBar(
        title: 'Report',
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Case Report',
                    style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
              child: Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write The Report Here',
                  ),
                ),
              ),
            ),
            defaultInputField(
                hint: '',
                field: 'Diagnose',
                inputController: diagnoseController),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonOutLined(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
                text: 'Finish report',
              ),
            )
          ],
        ),
      ),
    );
  }
}
