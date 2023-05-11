import 'package:final_project/Features/schedule/screens/schedule_layout.dart';
import 'package:final_project/dataLayer/model/Article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:final_project/routes/routes.dart';

import 'package:final_project/Features/home/screens/doctor_home.dart';
import 'package:final_project/Features/profile/screens/profile.dart';
import 'package:final_project/Features/schedule/screens/requests.dart';
import 'package:final_project/Features/schedule/screens/Appointments.dart';

import '../../Components/colors.dart';
import '../../dataLayer/logic/cubit/doctor_cubit.dart';
import '../../testapi.dart';
import '../articles/screens/Articles_page.dart';
import '../chat/screens/chat.dart';
import '../consultion/screens/prescription.dart';

class NavScreens extends StatefulWidget {
  const NavScreens({super.key});

  @override
  State<NavScreens> createState() => _NavScreensState();
}

class _NavScreensState extends State<NavScreens> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().getDoctorHomePage();
  }

  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      padding: NavBarPadding.all(0),
      context,
      controller: controller,
      screens: _buildScreens(),

      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Color.fromARGB(255, 255, 255, 255),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const DoctorHome(),
      chat(),
      DoctorScheduleLayout(),
      ArticlesPage(),
      MyProfile()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: const Icon(CupertinoIcons.home),
        activeColorPrimary: MyColors().secondcolor,
        inactiveColorPrimary: const Color.fromARGB(255, 171, 171, 196),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: const Icon(CupertinoIcons.chat_bubble_2),
        activeColorPrimary: MyColors().secondcolor,
        inactiveColorPrimary: const Color.fromARGB(255, 171, 171, 196),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: const Icon(Icons.date_range),
        activeColorPrimary: MyColors().secondcolor,
        inactiveColorPrimary: const Color.fromARGB(255, 171, 171, 196),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: const Icon(Icons.article_outlined),
        activeColorPrimary: MyColors().secondcolor,
        inactiveColorPrimary: const Color.fromARGB(255, 171, 171, 196),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: const Icon(CupertinoIcons.person),
        activeColorPrimary: MyColors().secondcolor,
        inactiveColorPrimary: const Color.fromARGB(255, 171, 171, 196),
      ),
    ];
  }
}
