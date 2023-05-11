import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../dataLayer/model/Article.dart';

class ArticleDetailesCart extends StatefulWidget {
  ArticleDetailesCart({super.key, required this.article});
  //todo

  Article article;

  @override
  State<ArticleDetailesCart> createState() => _ArticleDetailesCartState();
}

class _ArticleDetailesCartState extends State<ArticleDetailesCart> {
  bool click = false;

  Color pink = Colors.pink;
  Color green = Colors.green;
  Color orange = Colors.orange;
  late Color perColor;
  late Icon perIcon;

  percentageColor(likePercentage) {
    if (likePercentage < 50) {
      setState(() {
        perColor = pink;
      });
    } else if (66 > likePercentage && likePercentage > 49) {
      setState(() {
        perColor = orange;
      });
    } else {
      setState(() {
        perColor = green;
      });
    }
  }

  percentageIcon(likePercentage) {
    if (likePercentage < 50) {
      setState(() {
        perIcon = Icon(
          Icons.arrow_downward_outlined,
          color: perColor,
        );
      });
    } else {
      setState(() {
        perIcon = Icon(
          Icons.arrow_upward_outlined,
          color: perColor,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    percentageColor(70);
    percentageIcon(70);
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 8.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundImage: NetworkImage(
                        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg'),
                    backgroundColor: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 140.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ttt',
                            overflow: TextOverflow.ellipsis,
                            // widget.article.doctor!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                          Text(
                            'Specailty',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                          ),
                          Text(
                            widget.article.date!,
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Color.fromRGBO(101, 116, 207, 1),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          perIcon,
                          Text(
                            '70%',
                            style: TextStyle(color: perColor, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Text(widget.article.articleTitle!,
                          maxLines: 4,
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 47, 47),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     (widget.favorite == false)
                  //         ? Icons.favorite_border_outlined
                  //         : Icons.favorite,
                  //     color: Color.fromRGBO(101, 116, 207, 1),
                  //     size: 30,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.favorite = !widget.favorite;
                  //     });
                  //   },
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                child: Text(
                  widget.article.content!,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(217, 0, 0, 0)),
                ),
              ),
            ]),
          ),
        ));
  }
}
