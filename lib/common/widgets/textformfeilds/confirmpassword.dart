import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPassword extends StatefulWidget {
  final TextEditingController textEditingController;

  ConfirmPassword({required this.textEditingController, Key? key})
      : super(key: key);

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool pwdVisibility = false;
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
            'CONFIRM PASSWORD',
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
                hintText: "Re-Enter your password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
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
              validator: (val) {
                if (validatePassword == false) {
                  return 'passwords doesn\'t match';
                }
                if (validatePassword == true) {
                  return 'passwords doesn\'t match';
                } else
                  return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  bool validatePassword(String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return false;
    }
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }
}
