import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/screen/drawer/drawer_screen/drawer_screen.dart';
import 'package:lms/screen/home/all_courses/all_courses_screen.dart';
import 'package:lms/screen/home/home_screen/home_screen.dart';
import 'package:lms/screen/home/notification/notification_screen.dart';
import 'package:lms/screen/home/organization/organization_provider.dart';
import 'package:lms/screen/mentor_section/mentors_screen/mentors_screen.dart';
import 'package:lms/screen/profile/my_profile_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/new_app_bar.dart';
import 'package:provider/provider.dart';

import '../../dashboard/dashboard_screen_provider.dart';
import '../../mentor_section/mentors_screen/mentors_screen_provider.dart';
import '../../profile/my_profile_provider.dart';
import '../all_courses/all_courses_provider.dart';
import '../home_screen/home_provider.dart';
import '../organization/organization.dart';

class BottomNavBar extends StatefulWidget {
  final int? bottomNavigationIndex;

  const BottomNavBar({super.key, this.bottomNavigationIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 2;
  String? barName = "home".tr();
  int currentScreenIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    InstructorScreen(),
    OrganizationScreen(),
    HomeScreen(),
    AllCoursesScreen(),
    MyProfileScreen(isBottomNav: true),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      appBarName(selectedIndex);
    });
  }

  void appBarName(int radians) {
    switch (radians) {
      case 0:
        barName = "instructor".tr();
        break;
      case 1:
        barName = "Organization".tr();
        break;
      case 2:
        barName = "home".tr();
        break;
      case 3:
        barName = "all_courses".tr();
        break;
      case 4:
        barName = "profile".tr();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    // ignore: unused_local_variable
    final PageController myPage =
        PageController(initialPage: widget.bottomNavigationIndex ?? 0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => MentorsScreenProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => OrganizationProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => DashboardScreenProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => AllCoursesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => MyProfileProvider(), lazy: false),
      ],
      child: WillPopScope(
        onWillPop: () async {
          final differences = DateTime.now().difference(timeBackPressed);
          timeBackPressed = DateTime.now();
          if (differences >= const Duration(seconds: 2)) {
            String msg = "press_the_back_button_to_exit".tr();
            Fluttertoast.showToast(
              msg: msg,
            );
            return false;
          } else {
            Fluttertoast.cancel();
            SystemNavigator.pop();
            return true;
          }
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.white,
            child: selectedIndex == 2
                ? Image.asset(
                    'assets/home_page/bottom_home_two.png',
                    height: 24.h,
                    width: 24.w,
                  )
                : Image.asset(
                    'assets/home_page/bottom_home_one.png',
                    height: 24.h,
                    width: 24.w,
                  ),
            onPressed: () {
              setState(() {
                _onItemTapped(2);
              });
            },
          ),
          drawer: const AppDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: NewAppBar(
              appBarName: barName,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ));
              },
            ),
          ),
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(1, 1),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: BottomNavigationBar(
              elevation: 2,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(color: AppColors.primary),
              selectedItemColor: AppColors.primary,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: selectedIndex == 0
                      ? Image.asset(
                          'assets/home_page/bottom_mentor_two.png',
                          height: 24.h,
                          width: 24.w,
                        )
                      : Image.asset(
                          'assets/home_page/bottom_mentor_one.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'instructor'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: selectedIndex == 1
                      ? Image.asset(
                          'assets/home_page/bottom_dashboard_two.png',
                          height: 24.h,
                          width: 24.w,
                        )
                      : Image.asset(
                          'assets/home_page/bottom_dashboard_one.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                  // Image.asset(
                  //   'assets/images/bottomnavbar/heart.png',
                  //   height: 24.h,
                  //   width: 24.w,
                  // ),
                  label: 'Organizations'.tr(),
                ),
                const BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: selectedIndex == 3
                      ? Image.asset(
                          'assets/home_page/bottom_courses_two.png',
                          height: 24.h,
                          width: 24.w,
                        )
                      : Image.asset(
                          'assets/home_page/bottom_courses_one.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'courses'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: selectedIndex == 4
                      ? Image.asset(
                          'assets/home_page/bottom_profile_two.png',
                          height: 24.h,
                          width: 24.w,
                        )
                      : Image.asset(
                          'assets/home_page/bottom_profile_one.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                  // Image.asset(
                  //   'assets/images/profile (1).png',
                  //   height: 24.h,
                  //   width: 24.w,
                  // ),
                  label: 'profile'.tr(),
                ),
              ],
              currentIndex: selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
