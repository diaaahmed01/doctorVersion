import 'package:final_project/pages/schedule/screens/schedule_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:final_project/common/routes/routes.dart';

import 'package:final_project/pages/home/screens/doctor_home.dart';
import 'package:final_project/pages/profile/screens/profile.dart';

import '../../../Data/logic/cubit/doctor_cubit.dart';

import '../../../common/style/color.dart';
import '../../articles/screens/Articles_page.dart';
import '../../chat/screens/chat.dart';

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
      padding: const NavBarPadding.all(0),
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
      const DoctorScheduleLayout(),
      ArticlesPage(),
      const MyProfile()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: Image.asset(
          "assets/icons/home.png",
          width: 25,
          height: 25,
          color: AppColor.primaryColor,
        ),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: const Color.fromARGB(255, 196, 196, 215),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: Image.asset(
          "assets/icons/chat.png",
          width: 25,
          height: 25,
          color: AppColor.primaryColor,
        ),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: const Color.fromARGB(255, 196, 196, 215),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: Image.asset(
          "assets/icons/calendar.png",
          width: 25,
          height: 25,
          color: AppColor.primaryColor,
        ),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: const Color.fromARGB(255, 196, 196, 215),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: Image.asset(
          "assets/icons/article.png",
          width: 25,
          height: 25,
          color: AppColor.primaryColor,
        ),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: const Color.fromARGB(255, 196, 196, 215),
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: appRouter.onGenerateRoute),
        icon: Image.asset(
          "assets/icons/user.png",
          width: 25,
          height: 25,
          color: AppColor.primaryColor,
        ),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: const Color.fromARGB(255, 196, 196, 215),
      ),
    ];
  }
}
