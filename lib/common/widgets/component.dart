import '../style/color.dart';

import 'package:flutter/material.dart';

Widget defultButton({
  double height = double.infinity,
  double width = double.infinity,
  Color background = const Color(0xFF6574CF),
  bool isUpperCase = true,
  required String text,
  required VoidCallback onPressed,
  double radius = 5.0,
}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
Widget defultButton2({
  double height = double.infinity,
  double width = double.infinity,
  required VoidCallback onPressed,
  Color background = const Color(0xFF6574CF),
  bool isUpperCase = true,
  required String text,
  double radius = 5.0,
}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
Widget defultTextFormFeild({
  required TextInputType type,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
Widget defultSpace() => Container(
      color: Colors.grey[300],
      height: 1.0,
      width: double.infinity,
    );
Widget defultTextFormFeild2({
  required TextInputType type,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        labelText: label,
        border: InputBorder.none,
      ),
    );
Widget defultRow({
  required IconData iconData,
  required String text,
  required IconData iconData2,
  required VoidCallback Onpressed,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              size: 30.0,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          Align(
              child: Text(text,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[800]))),
          SizedBox(
            width: 110.0,
          ),
          IconButton(
            onPressed: Onpressed,
            icon: Icon(
              iconData2,
              size: 20.0,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
