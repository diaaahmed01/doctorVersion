import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_project/dataLayer/Data/Repository.dart';
import 'package:final_project/dataLayer/logic/cubit/doctor_cubit.dart';
import 'package:final_project/dataLayer/model/Article.dart';
import 'package:final_project/dataLayer/model/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Appbars/AppBar.dart';
import '../../../Components/colors.dart';
import '../../../Components/defaultbutton.dart';

class AddArticle extends StatefulWidget {
  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  final formKey = GlobalKey<FormState>();
  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleFieldController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  var items = [
    'specialty 1',
    'specialty 2',
    'specialty 3',
    'specialty 4',
    'specialty 5',
  ];
  String? selectedSpecialty;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldState,
      appBar: const myAppBar(
        title: 'ADD ARTICLE',
        showActionIcon: true,
      ),
      body: BlocBuilder<DoctorCubit, DoctorCubitState>(
        builder: (context, state) {
          if (state is DoctorHomePageLoaded) {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  color: MyColors().maincolor,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w,
                              vertical: 12.0.h,
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Article Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromARGB(207, 46, 46, 46),
                                      fontSize: 14.0.sp),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextFormField(
                                  controller: articleTitleController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 13.sp, color: Colors.black38),
                                    hintText: 'Write The Name For Your Article',
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Article Field',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(207, 46, 46, 46),
                                  fontSize: 14.0.sp),
                            ),
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller: articleFieldController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      color: Colors.black38),
                                  hintText: 'Write your article here',
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w,
                          vertical: 12.0.h,
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Add Content',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(207, 46, 46, 46),
                                  fontSize: 14.0.sp),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: contentController,
                              maxLines: 7,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    color: Colors.black38),
                                hintText: 'Write your article here',
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          children: [
                            ButtonOutLined(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Article article = Article(
                                        content: contentController.text,
                                        articleField:
                                            articleFieldController.text,
                                        articleTitle:
                                            articleTitleController.text,
                                        date: DateTime.now().toString(),
                                        doctor: state.homePage.doctor);

                                    context
                                        .read<Repository>()
                                        .addArticle(article);

                                    // AwesomeDialog(
                                    //   btnOkColor: MyColors().secondcolor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType: DialogType.success,
                                    //   body: Center(
                                    //     child: Text(
                                    //       'Your Article was published Successfully',
                                    //       style: TextStyle(
                                    //           fontStyle: FontStyle.italic),
                                    //     ),
                                    //   ),
                                    //   btnOkOnPress: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/', (route) => false);
                                    //   },
                                    // )..show();
                                    context
                                        .read<DoctorCubit>()
                                        .getDoctorHomePage();
                                  }
                                },
                                text: 'Publish Article'),
                            Row(
                              children: [
                                Expanded(
                                    child: ButtonOutLined(
                                  onPressed: () {},
                                  text: 'Add to drafts',
                                  color: Colors.green,
                                )),
                                Expanded(
                                    child: ButtonOutLined(
                                  onPressed: () {},
                                  text: 'Cancel',
                                  color: Colors.pink,
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
