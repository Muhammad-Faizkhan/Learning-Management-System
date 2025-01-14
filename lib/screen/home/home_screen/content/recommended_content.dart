import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/home_screen/home_provider.dart';
import 'package:xirfadkaab/screen/home/see_all_screen/see_all_screen.dart';
import 'package:xirfadkaab/screen/home/widgets/course_title.dart';
import 'package:xirfadkaab/screen/home/widgets/reommanded_course_content.dart';

class RecommendedContent extends StatelessWidget {
  final HomeProvider? provider;
  const RecommendedContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: provider?.latestClasses?.isEmpty ?? false ? false : true,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CourseTitle(
                  title: "recommended_for_you".tr(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeeAllScreen(
                              slugName: "discount_courses",
                              appBarName: "recommended_for_you".tr()),
                        ));
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                RecommendedCourseContent(
                    userId: provider?.userId,
                    latestClasses: provider?.latestClasses),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
