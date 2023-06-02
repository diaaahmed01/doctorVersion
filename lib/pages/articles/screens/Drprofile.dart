import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/model/Doctor.dart';
import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfile({super.key, required this.doctor});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const myAppBar(
        title: 'DOCTOR Profile',
        showActionIcon: true,
      ),
      body: Container(
        color: AppColor.background,
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
                            color: const Color.fromARGB(255, 18, 18, 18),
                            fontSize: 20.0.sp)),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.verified_rounded,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(doctor.doctorSpeciality!,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        doctor.rank!,
                        style: const TextStyle(
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
                              style: const TextStyle(
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
                              style: const TextStyle(
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
                const SizedBox(
                  height: 40,
                ),
                const Row(
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
                const SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(children: [
                    Text(
                      doctor.aboutDoctor!,
                      style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 15,
                          color: Color.fromARGB(255, 83, 83, 83)),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: Container(
                width: 370,
                color: AppColor.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('STATS',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'more',
                            style: TextStyle(
                                fontSize: 15, color: AppColor.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          color: AppColor.primaryColor,
                        ),
                        SizedBox(width: 10),
                        Text('studied at Alexandria University',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.local_hospital_outlined,
                          color: AppColor.primaryColor,
                        ),
                        SizedBox(width: 10),
                        Text('Practicing at NYU langone Hospitals',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: AppColor.primaryColor,
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
