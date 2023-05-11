import 'package:final_project/dataLayer/Data/Repository.dart';
import 'package:final_project/dataLayer/logic/cubit/doctor_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';
import '../../../Components/colors.dart';

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with AutomaticKeepAliveClientMixin {
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: myAppBar(
        title: 'Profile',
        showActionIcon: true,
        leading: SizedBox(),
      ),
      body: BlocBuilder<DoctorCubit, DoctorCubitState>(
        builder: (context, state) {
          if (state is DoctorHomePageLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DoctorHomePageLoaded) {
            return SingleChildScrollView(
                child: Container(
                    width: mywidth,
                    color: MyColors().maincolor,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: mywidth * 0.05),
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "${(state).homePage.doctor!.doctorImage}"),
                              radius: 65,
                            ),
                          ),
                        ),
                        Text(
                          ' ${(state).homePage.doctor!.doctorName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Text('id: 24235',
                              style: TextStyle(
                                  color: Color.fromARGB(175, 0, 0, 0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: myheight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '205',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Total patients',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: myheight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '15',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'This month',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: myheight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "${(state).homePage.doctor!.rank}",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Rank',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: mywidth * 0.05,
                        //       vertical: myheight * 0.009),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(5)),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.all(3.0),
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   color:
                        //                       Color.fromARGB(58, 138, 150, 224),
                        //                   borderRadius:
                        //                       BorderRadius.circular(5)),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(10.0),
                        //                 child: Icon(
                        //                   Icons.person_4_outlined,
                        //                   color: MyColors().secondcolor,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding:
                        //                 EdgeInsets.only(left: mywidth * 0.03),
                        //             child: Text(
                        //               'My Patients',
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.w400,
                        //                   fontSize: 17),
                        //             ),
                        //           ),
                        //           Spacer(),
                        //           IconButton(
                        //               onPressed: () {
                        //                 // context
                        //                 //     .read<Repository>()
                        //                 //     .getDoctorHomePageInfo(
                        //                 //         '644720ec6b72f3ad6db85f19');
                        //               },
                        //               icon: Icon(
                        //                 Icons.arrow_forward_ios_rounded,
                        //                 color: MyColors().secondcolor,
                        //               ))
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mywidth * 0.05,
                              vertical: myheight * 0.009),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(58, 138, 150, 224),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.watch_later_outlined,
                                          color: MyColors().secondcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: mywidth * 0.03),
                                    child: Text(
                                      'Appointments',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: MyColors().secondcolor,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mywidth * 0.05,
                              vertical: myheight * 0.009),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(58, 138, 150, 224),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: MyColors().secondcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: mywidth * 0.03),
                                    child: Text(
                                      'Edit profile',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: MyColors().secondcolor,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mywidth * 0.05,
                              vertical: myheight * 0.009),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(58, 138, 150, 224),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.article_outlined,
                                          color: MyColors().secondcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: mywidth * 0.03),
                                    child: Text(
                                      'My Articles',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: MyColors().secondcolor,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        //   Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: mywidth * 0.05,
                        //         vertical: myheight * 0.009),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(5)),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Row(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.all(3.0),
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                     color:
                        //                         Color.fromARGB(58, 138, 150, 224),
                        //                     borderRadius:
                        //                         BorderRadius.circular(5)),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(10.0),
                        //                   child: Icon(
                        //                     Icons.library_books_outlined,
                        //                     color: MyColors().secondcolor,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Padding(
                        //               padding:
                        //                   EdgeInsets.only(left: mywidth * 0.03),
                        //               child: Text(
                        //                 'Saved Articles',
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.w400,
                        //                     fontSize: 17),
                        //               ),
                        //             ),
                        //             Spacer(),
                        //             IconButton(
                        //                 onPressed: () {},
                        //                 icon: Icon(
                        //                   Icons.arrow_forward_ios_rounded,
                        //                   color: MyColors().secondcolor,
                        //                 ))
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                      ],
                    )));
          } else {
            return Text('error');
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
