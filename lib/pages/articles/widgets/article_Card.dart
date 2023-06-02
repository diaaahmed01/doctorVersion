import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/model/Article.dart';
import '../../../Data/model/Doctor.dart';
import '../../../Data/repositroy/Repository.dart';

class ArticleCart extends StatefulWidget {
  ArticleCart({super.key, required this.article});

  final Article article;

  @override
  State<ArticleCart> createState() => _ArticleCartState();
}

class _ArticleCartState extends State<ArticleCart> {
  // getDoctor() async {
  //   Doctor articleDoctor = await context
  //       .read<Repository>()
  //       .getDoctorById(widget.article.doctor!.id!);
  //   return articleDoctor;
  // }

  bool click = false;
  bool favorite = false;
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
    Future<dynamic> articleDoctor =
        context.read<Repository>().getDoctorById(widget.article.doctor!.id!);

    percentageColor(70);
    percentageIcon(70);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Doctor doctor = await articleDoctor as Doctor;
                      Navigator.pushNamed(context, '/doctorprofile',
                          arguments: doctor);
                    },
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg'),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 140.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'test',
                            //   widget.article.doctor?.doctorName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                          Text(
                            'Specialty',
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
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Color.fromRGBO(101, 116, 207, 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          perIcon,
                          Text(
                            '70',
                            style: TextStyle(color: perColor, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Text(widget.article.articleTitle!,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 47, 47),
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      color: Color.fromRGBO(101, 116, 207, 1),
                      icon: Icon(
                        (click == false)
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          click = !click;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              if (click)
                Text(
                  widget.article.content!,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(217, 0, 0, 0)),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      (favorite == false)
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color: Color.fromRGBO(101, 116, 207, 1),
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/articleDetailes',
                            arguments: widget.article);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromRGBO(101, 116, 207, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8),
                            child: Text(
                              'Show more',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
