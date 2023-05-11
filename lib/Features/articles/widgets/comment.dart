import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../dataLayer/model/ArticleCommunication.dart';

class CommentCart extends StatefulWidget {
  CommentCart({super.key, required this.comment});
  Comment comment;

  @override
  State<CommentCart> createState() => _CommentCartState();
}

class _CommentCartState extends State<CommentCart> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/doctorprofile',
                          arguments: widget.comment.doctor);
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.comment.doctor!.doctorImage!),
                      radius: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 12.0),
                  child: Container(
                    width: 140.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.comment.doctor!.doctorName!,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                              color: Color.fromARGB(205, 0, 0, 0)),
                        ),
                        Text(widget.comment.time,
                            style: TextStyle(
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                                color: Color.fromARGB(205, 0, 0, 0)))
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 1,
                        icon: Icon(
                          (liked == false)
                              ? Icons.favorite_border_outlined
                              : Icons.favorite,
                          color: Color.fromRGBO(101, 116, 207, 1),
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: Color.fromRGBO(101, 116, 207, 1),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.comment.content,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
