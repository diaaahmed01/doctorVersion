import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  const myAppBar(
      {super.key,
      this.title = '',
      this.leading,
      this.titleWidget,
      this.actionwidget,
      this.showActionIcon = false,
      this.onMenuActionTap});
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? actionwidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(101, 116, 207, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      )
                    : Center(child: titleWidget!)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                if (showActionIcon)
                  actionwidget ??
                      Transform.translate(
                        offset: const Offset(10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(32, 255, 255, 255),
                              borderRadius: BorderRadius.circular(14)),
                          child: InkWell(
                            onTap: onMenuActionTap ??
                                () {
                                  Navigator.pushNamed(
                                      context, '/Notifications');
                                },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
