import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/logic/cubit/doctor_cubit.dart';
import '../../../Data/model/Article.dart';
import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';
import '../../../common/widgets/dropdown.dart';
import '../../../common/widgets/shimmer.dart';

import '../widgets/article_Card.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({
    Key? key,
    //  required this.allArticles,
  }) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage>
    with AutomaticKeepAliveClientMixin {
  final List<Article> filteredArticles = [];
  String selectedSpecialty = 'All Specialties';
  late List<Article> allArticles;
  var items = [
    'specialty 1',
    'specialty 2',
    'specialty 3',
    'specialty 4',
    'specialty 5',
  ];

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: const myAppBar(
        title: 'ARTICLES',
        showActionIcon: true,
        leading: SizedBox(),
      ),
      body: BlocBuilder<DoctorCubit, DoctorCubitState>(
        builder: (context, state) {
          if (state is DoctorHomePageLoading) {
            return Container(
              color: AppColor.background,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              shimmerwidget(
                                  width: 60.w, height: 60.w, radius: 50),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  shimmerwidget(width: 70.w, height: 10.w),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  shimmerwidget(width: 100.w, height: 10.w),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  shimmerwidget(width: 50.w, height: 10.w),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          shimmerwidget(height: 120.h)
                        ],
                      ),
                    ),
                  ),
                  itemCount: 4,
                ),
              ),
            );
          }
          if (state is DoctorHomePageLoaded) {
            allArticles = (state).homePage.articles;
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 239, 251)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/AddArticle');
                                },
                                icon: const Icon(
                                  Icons.my_library_add_rounded,
                                  color: Color.fromRGBO(101, 116, 207, 1),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(101, 116, 207, 1)),
                                color: const Color.fromRGBO(166, 171, 227, 0.2),
                                borderRadius: BorderRadius.circular(6)),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    selectedSpecialty,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(101, 116, 207, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                if (selected == true)
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          selected = false;
                                          selectedSpecialty = 'All Specialties';
                                          // filteredArticles = [];
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Color.fromRGBO(101, 116, 207, 1),
                                      )),
                                Padding(
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: DropDownMenuFb1(
                                      menuList: [
                                        PopupMenuItem(
                                          child: Text(items[0]),
                                          onTap: () {
                                            //  SearchedSpecialty(items[0]);
                                            setState(() {
                                              selectedSpecialty = items[0];
                                              selected = true;
                                            });
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Text(items[1]),
                                          onTap: () {
                                            //   SearchedSpecialty(items[1]);
                                            setState(() {
                                              selectedSpecialty = items[1];
                                              selected = true;
                                            });
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Text(items[2]),
                                          onTap: () {
                                            //   SearchedSpecialty(items[2]);
                                            setState(() {
                                              selectedSpecialty = items[2];
                                              selected = true;
                                            });
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Text(items[3]),
                                          onTap: () {
                                            //   SearchedSpecialty(items[3]);
                                            setState(() {
                                              selectedSpecialty = items[3];
                                              selected = true;
                                            });
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Text(items[4]),
                                          onTap: () {
                                            //    SearchedSpecialty(items[4]);
                                            setState(() {
                                              selectedSpecialty = items[4];
                                              selected = true;
                                            });
                                          },
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildLoadedListWidgets()
                  ],
                ),
              ),
            );
          } else
            return const Text('an error has occurred');
        },
      ),
      // bottomNavigationBar: BottomNavBarFb5(),
    );
  }

  Widget buildLoadedListWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: filteredArticles.isEmpty
            ? allArticles.length
            : filteredArticles.length,
        itemBuilder: (context, index) {
          return ArticleCart(
            article: filteredArticles.isEmpty
                ? allArticles[index]
                : filteredArticles[index],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
