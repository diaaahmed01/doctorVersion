import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/logic/cubit/communications_cubit.dart';
import '../../../Data/logic/cubit/doctor_cubit.dart';
import '../../../Data/model/Article.dart';
import '../../../Data/model/ArticleCommunication.dart';
import '../../../Data/model/Doctor.dart';
import '../../../Data/repositroy/Repository.dart';
import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';
import '../../../common/widgets/component.dart';

import '../../../common/widgets/defaultbutton.dart';
import '../../../common/widgets/shimmer.dart';

import 'package:flutter/material.dart';

import '../widgets/article_details.dart';
import '../widgets/comment.dart';

// ignore: camel_case_types, must_be_immutable
class articleDetails extends StatefulWidget {
  articleDetails({
    required this.article,
    super.key,
  });
  Article article;
  // Doctor doctor;
  @override
  State<articleDetails> createState() => _articleDetailsState();
}

class _articleDetailsState extends State<articleDetails> {
  late List<Comment> allComments;
  late List<Like> allLikes;
  late Doctor doctor;
  bool addComment = false;
  bool liked = false;
  bool dislike = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    context.read<CommunicationsCubit>().getArticleCommunication(
        articleCommunicationId: widget.article.articleCommunication!);

    doctor = context.read<DoctorCubit>().doctor;
  }

  final TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: AppColor.background,
        key: scaffoldKey,
        appBar: const myAppBar(
          title: 'ARTICLES',
          showActionIcon: true,
          leading: BackButton(color: Colors.white),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              color: const Color.fromRGBO(169, 179, 243, 0.09),
              child: Column(
                children: [
                  ArticleDetailesCart(
                    article: widget.article,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (dislike == false) {
                                    setState(() {
                                      liked = !liked;
                                    });
                                  } else {
                                    setState(() {
                                      liked = !liked;
                                      dislike = !dislike;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      (liked == false)
                                          ? Icons.thumb_up_alt_outlined
                                          : Icons.thumb_up_alt,
                                      size: 23.sp,
                                      color: const Color.fromRGBO(
                                          101, 116, 207, 1),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      'Like',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: const Color.fromRGBO(
                                              101, 116, 207, 1)),
                                    ),
                                  ],
                                )),
                            GestureDetector(
                              onTap: () {
                                if (liked == false) {
                                  setState(() {
                                    dislike = !dislike;
                                  });
                                } else {
                                  setState(() {
                                    liked = !liked;
                                    dislike = !dislike;
                                  });
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    (dislike == false)
                                        ? Icons.thumb_down_alt_outlined
                                        : Icons.thumb_down_alt,
                                    color: const Color(0xFF6574CF),
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'dislike',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: const Color(0xFF6574CF)),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  addComment = !addComment;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    color: const Color(0xFF6574CF),
                                    Icons.mode_comment_outlined,
                                    size: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Comment',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: const Color(0xFF6574CF)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (addComment == true)
                    Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(
                                          199, 201, 218, 0.596)),
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  controller: _inputController,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            106, 106, 106, 0.647)),
                                    hintText: 'Add a comment ',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ButtonFilled(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                addComment = !addComment;
                              });
                              Comment comment = Comment(
                                doctor: doctor,
                                content: _inputController.text,
                                time: DateTime.now().toString(),
                              );
                              Repository().addComment(
                                  comment, widget.article.articleCommunication);

                              context
                                  .read<CommunicationsCubit>()
                                  .getArticleCommunication(
                                      articleCommunicationId:
                                          widget.article.articleCommunication!);
                            }
                          },
                          text: 'Comment',
                        )
                      ],
                    ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        BlocBuilder<CommunicationsCubit, CommunicationsState>(
                          builder: (context, state) {
                            if (state is ArticleCommunicationsLoading) {
                              return Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 4.h),
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              shimmerwidget(
                                                  width: 60.w,
                                                  height: 60.w,
                                                  radius: 50),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  shimmerwidget(
                                                      width: 70.w,
                                                      height: 10.w),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  shimmerwidget(
                                                      width: 60.w,
                                                      height: 10.w),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          shimmerwidget(height: 50.h)
                                        ],
                                      ),
                                    ),
                                  ),
                                  itemCount: 4,
                                ),
                              );
                            }
                            if (state is ArticleCommunicationsLoaded) {
                              allComments = state.articleCommunication.comments;
                              allLikes = state.articleCommunication.likes;

                              return Container(
                                  color: AppColor.background,
                                  width: double.maxFinite,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${allLikes.length}',
                                              style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          height: 300.h,
                                                          color: Colors.white,
                                                          child:
                                                              SingleChildScrollView(
                                                            physics:
                                                                const AlwaysScrollableScrollPhysics(),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5.h,
                                                                            left: 7.w),
                                                                        child:
                                                                            Text(
                                                                          'All likes',
                                                                          style: TextStyle(
                                                                              color: AppColor.primaryColor,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16.sp),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                buildLikeList(),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'has liked this article',
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Comments(${allComments.length})',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: const Color.fromARGB(
                                                    164, 0, 0, 0),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      buildLoadedListWidgets(),
                                    ],
                                  ));
                            } else
                              return const Text('server error');
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildLikeList() {
    return ListView.separated(
        separatorBuilder: (context, index) => defultSpace(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allLikes.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, '/doctorprofile',
                          arguments: widget);
                    },
                    child: CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.0.h),
                    child: Text(allLikes[index].id),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: const Icon(
                      Icons.thumb_up_alt,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildLoadedListWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: allComments.length,
        itemBuilder: (context, index) {
          return CommentCart(
            comment: allComments[index],
          );
        });
  }
}
