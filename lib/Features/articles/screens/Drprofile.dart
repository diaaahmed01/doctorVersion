import 'package:final_project/Components/colors.dart';
import 'package:final_project/dataLayer/Data/Repository.dart';
import 'package:final_project/dataLayer/model/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfile({super.key, required this.doctor});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'DOCTOR Profile',
        showActionIcon: true,
      ),
      body: Container(
        color: MyColors().maincolor,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 30.0, 0.0, 15.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(doctor.doctorImage!),
                  radius: 55.0.r,
                )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(doctor.doctorName!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontSize: 20.0.sp)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.verified_rounded,
                      color: MyColors().secondcolor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(doctor.doctorSpeciality!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: MyColors().secondcolor,
                      ),
                      Text(
                        doctor.rank!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
                          child: Text(doctor.location!,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                          child: Text('Location',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 15.0)),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey,
                      width: 2,
                      height: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 40, 0),
                          child: Text(doctor.experienceYears!,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 40, 0),
                          child: Text('Experience',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 15.0)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(children: [
                    Text(
                      doctor.aboutDoctor!,
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 15,
                          color: Color.fromARGB(255, 83, 83, 83)),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: Container(
                width: 370,
                color: MyColors().maincolor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('STATS',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'more',
                            style: TextStyle(
                                fontSize: 15, color: MyColors().secondcolor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          color: MyColors().secondcolor,
                        ),
                        SizedBox(width: 10),
                        Text('studied at Alexandria University',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_hospital_outlined,
                          color: MyColors().secondcolor,
                        ),
                        SizedBox(width: 10),
                        Text('Practicing at NYU langone Hospitals',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: MyColors().secondcolor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('324 Happy Patients',
                            style: TextStyle(fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
