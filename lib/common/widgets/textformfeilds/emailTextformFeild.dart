import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController inputController;

  const EmailTextFormField({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(191, 198, 210, 0.453);
    const secondaryColor = Color.fromRGBO(128, 106, 239, 1);
    const accentColor = Color.fromRGBO(191, 198, 210, 0.204);

    const errorColor = Color(0xffEF4444);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EMAIL',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(124, 135, 157, 1)),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: TextFormField(
              controller: inputController,
              onChanged: (value) {
                //Do something wi
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: primaryColor),
                filled: true,
                fillColor: accentColor,
                hintText: 'Enter your email',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 125, 125, 125).withOpacity(.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'Email required';
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(val)) {
                  return 'Enter Correct email';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
