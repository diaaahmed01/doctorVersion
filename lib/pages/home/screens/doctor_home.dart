import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/logic/cubit/doctor_cubit.dart';
import '../../../Data/model/Appointment.dart';
import '../../../Data/model/Patient.dart';
import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';

import 'package:flutter/material.dart';

import '../../schedule/widgets/request.dart';

import 'home_shimmer.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

List patients = [
  'https://th.bing.com/th/id/OIP.oO92fAsb3nCJTWZzuvJyhgHaHa?pid=ImgDet&rs=1',
  'https://cdn.smehost.net/rcarecordscom-usrcaprod/wp-content/uploads/2016/08/Martin-Garrix-2019_1-683x1024.jpg',
  'https://th.bing.com/th/id/OIP.bdpd4yBSzYVdtiza5pVuGAHaEj?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.86b08b50d5f3888068b4889d263c8116?rik=Z%2b6caie3ClrGrw&pid=ImgRaw&r=0',
];

class _DoctorHomeState extends State<DoctorHome>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;
    double myHeight = size.height;
    double myWidth = size.width;
    return BlocBuilder<DoctorCubit, DoctorCubitState>(
      builder: (context, state) {
        if (state is DoctorHomePageLoading) {
          return const HomeShimmer();
        }
        if (state is DoctorHomePageLoaded) {
          Appointment appointment = Appointment(
              accepted: 'false',
              appointmentDate: DateTime(
                2023,
              ),
              appointmentTime: '12:00',
              pateintRequest: 'btni wg3ani',
              patient: Patient(
                  id: '1',
                  patientName: 'khaled',
                  patientAge: '25',
                  patientImgUrl:
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=2000'));
          return Scaffold(
              appBar: myAppBar(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.homePage.doctor!.doctorImage!),
                  radius: 27.0,
                ),
                titleWidget: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(112, 159, 168, 218),
                        borderRadius: BorderRadius.circular(4)),
                    width: myWidth * 0.32,
                    height: myHeight * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: myWidth * 0.011,
                        ),
                        const Text(
                          'Apr,2023',
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        ),
                      ],
                    )),
                showActionIcon: true,
              ),
              backgroundColor: AppColor.background,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColor.primaryColor,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Good Morning, Dr.${state.homePage.doctor!.doctorName}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: myHeight * 0.01,
                                  ),
                                  const Text(
                                    'You have 15 patient today',
                                    style: TextStyle(
                                      color: Color.fromARGB(206, 255, 255, 255),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, top: 14.h),
                      child: const Text(
                        'waiting queue',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 138, 138, 138)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      child: Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < patients.length; i++)
                                  Align(
                                    widthFactor: 0.7,
                                    child: CircleAvatar(
                                      radius: 35.w,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                          radius: 30.w,
                                          backgroundImage:
                                              NetworkImage(patients[i])),
                                    ),
                                  )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/queue',
                                    arguments: patients);
                                print('tapeed');
                              },
                              child: CircleAvatar(
                                radius: 30.w,
                                backgroundColor: AppColor.primaryColor,
                                child: const Text(
                                  '+4',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 13.0),
                      child: Text(
                        'today\'s requests',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 138, 138, 138)),
                      ),
                    ),
                    Center(
                        child: appointmentRequests(
                      appointment: appointment,
                    )),
                    const Padding(
                      padding: EdgeInsets.only(left: 13.0),
                      child: Text(
                        'next patient',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 138, 138, 138)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/originals/12/3e/3f/123e3f9ec74f1cb96b24087e6a51c5c7.jpg'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(
                                    width: myWidth * 0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Mohamed Hassan',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      SizedBox(
                                        height: myHeight * 0.002,
                                      ),
                                      const Text('21 years/Allergy',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text('08:00 AM',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert_outlined,
                                        color: AppColor.primaryColor,
                                        size: 22.0,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: myHeight * 0.01,
                              ),
                              Row(
                                children: [
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: myWidth * 0.6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromRGBO(
                                                  9, 242, 91, 1)),
                                          color: const Color.fromRGBO(
                                              0, 255, 34, 0.075)),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Center(
                                          child: Text(
                                            'VIDEO CALL STARTING SOON',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Color.fromRGBO(
                                                    9, 242, 91, 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.chat_bubble_outline,
                                        size: 20.0,
                                        color: AppColor.primaryColor,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 13.0),
                      child: Text(
                        'for you to read',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 138, 138, 138)),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255, 57, 37, 203),
                                Color.fromARGB(255, 98, 17, 211),
                                Color.fromARGB(255, 140, 99, 193),
                              ],
                            )),
                        width: myWidth / 1.1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Certain healthy habits can fight chronic inflammation',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: myHeight * 0.05,
                              ),
                              Row(
                                children: [
                                  const Text('article by ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  const Text(
                                    'Dr. Morad ali',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppColor.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              )
              //   bottomNavigationBar: BottomNavBarFb5(),
              );
        }
        return const Text('error!');
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
