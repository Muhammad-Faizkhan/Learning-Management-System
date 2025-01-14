import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/home_screen/home_provider.dart';
import 'package:xirfadkaab/screen/home/see_all_screen/see_all_screen.dart';
import 'package:xirfadkaab/screen/home/widgets/course_title.dart';
import 'package:xirfadkaab/screen/home/widgets/top_rated_content.dart';

class BestRatedContent extends StatelessWidget {
  final HomeProvider? provider;
  const BestRatedContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Visibility(
        visible: provider?.bestRates?.isEmpty ?? false ? false : true,
        child: Column(
          children: [
            CourseTitle(
              title: "best_rated_courses".tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                        slugName: "best_rated_courses",
                        appBarName: "best_rated_courses".tr(),
                      ),
                    ));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            TopRatedContent(bestRates: provider?.bestRates),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
