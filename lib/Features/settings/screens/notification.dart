import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';
import '../../../Components/component.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _Last_ScreenState createState() => _Last_ScreenState();
}

class _Last_ScreenState extends State<Notifications> {
  bool val1 = true;
  bool val2 = false;
  bool val3 = false;
  bool val4 = true;
  bool val5 = true;
  bool val6 = true;
  onChangeFunction1(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue1) {
    setState(() {
      val2 = newValue1;
    });
  }

  onChangeFunction3(bool newValue1) {
    setState(() {
      val3 = newValue1;
    });
  }

  onChangeFunction4(bool newValue1) {
    setState(() {
      val4 = newValue1;
    });
  }

  onChangeFunction5(bool newValue1) {
    setState(() {
      val5 = newValue1;
    });
  }

  onChangeFunction6(bool newValue1) {
    setState(() {
      val6 = newValue1;
    });
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar(
        title: 'Notifications',
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFecf1f4),
          height: h,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _headSection(),
                  Align(
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: 700.0.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customSwitch1(
                              'Notifications', val1, onChangeFunction1),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                          customSwitch2(
                              'Send reccomendations', val2, onChangeFunction2),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                          customSwitch3(
                              'New questions', val3, onChangeFunction3),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                          customSwitch4(
                              'Product Update', val4, onChangeFunction4),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                          customSwitch5('Vibration', val5, onChangeFunction5),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                          customSwitch6('Sound', val6, onChangeFunction6),
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text('Some description',
                                style: TextStyle(
                                    fontSize: 15.0.sp,
                                    color: Colors.grey[600])),
                          ),
                          defultSpace(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBarFb5(),
    );
  }

  _headSection() {
    return Container(
      height: 300,
      color: Color(0xFF6574CF),
      child: Stack(
        children: [],
      ),
    );
  }

  customSwitch1(String text, bool val, Function onChangeMethod1) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Notofications',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod1(newValue);
                }),
          ),
        ],
      ),
    );
  }

  customSwitch2(String text, bool val, Function onChangeMethod2) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Send reccomendations',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod2(newValue);
                }),
          ),
        ],
      ),
    );
  }

  customSwitch3(String text, bool val, Function onChangeMethod3) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('New questions',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod3(newValue);
                }),
          ),
        ],
      ),
    );
  }

  customSwitch4(String text, bool val, Function onChangeMethod4) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Product Update',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod4(newValue);
                }),
          ),
        ],
      ),
    );
  }

  customSwitch5(String text, bool val, Function onChangeMethod5) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Vibration',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod5(newValue);
                }),
          ),
        ],
      ),
    );
  }

  customSwitch6(String text, bool val, Function onChangeMethod6) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Sound',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Color(0xFF6574CF),
                value: val,
                onChanged: (newValue) {
                  onChangeMethod6(newValue);
                }),
          ),
        ],
      ),
    );
  }
}
