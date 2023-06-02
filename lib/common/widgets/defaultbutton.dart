import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonFilled extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ButtonFilled({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(106, 121, 212, 1),
            borderRadius: BorderRadius.circular(5.w),
          ),
          width: 320.w,
          height: 40.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}

class ButtonOutLined extends StatelessWidget {
  final String text;
  final Color? color;
  final Function() onPressed;
  const ButtonOutLined(
      {required this.text, required this.onPressed, Key? key, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(138, 146, 194, 0.095),
              borderRadius: BorderRadius.circular(5.w),
              border: Border.all(
                  width: 1, color: color ?? Color.fromRGBO(106, 121, 212, 1))),
          height: 40.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: color ?? Color.fromRGBO(106, 121, 212, 1)),
                ),
              )
            ],
          )),
    );
  }
}
