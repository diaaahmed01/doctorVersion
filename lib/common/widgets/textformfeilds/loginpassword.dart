import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPassword extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String felid;
  const LoginPassword(
      {required this.felid,
      required this.textEditingController,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(191, 198, 210, 0.453);
    const secondaryColor = Color.fromRGBO(128, 106, 239, 1);
    const accentColor = Color.fromRGBO(191, 198, 210, 0.204);

    const errorColor = Color(0xffEF4444);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.felid,
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
              controller: widget.textEditingController,
              obscureText: !pwdVisibility,
              decoration: InputDecoration(
                filled: true,
                fillColor: accentColor,
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 125, 125, 125).withOpacity(.75)),
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () => pwdVisibility = !pwdVisibility,
                  ),
                  child: Icon(
                    pwdVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Password required';
                if (value.length < 8) return 'Wrong password';

                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
