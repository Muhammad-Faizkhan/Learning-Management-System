import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/home_screen/home_provider.dart';
import 'package:xirfadkaab/screen/home/see_all_screen/see_all_screen.dart';
import 'package:xirfadkaab/screen/home/widgets/course_title.dart';
import 'package:xirfadkaab/screen/home/widgets/treanding_course_content.dart';

class LatestCourseContent extends StatelessWidget {
  final HomeProvider? provider;
  const LatestCourseContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Visibility(
        visible: provider?.latestClasses?.isEmpty ?? true ? false : true,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            CourseTitle(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                          slugName: "latest_courses",
                          appBarName: "latest_courses".tr()),
                    ));
              },
              title: "latest_courses".tr(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TrendingPageContent(
                userId: provider?.userId,
                latestClasses: provider?.latestClasses),
          ],
        ),
      ),
    );
  }
}
