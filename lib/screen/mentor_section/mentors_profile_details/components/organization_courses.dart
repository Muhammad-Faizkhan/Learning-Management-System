import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:xirfadkaab/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:xirfadkaab/screen/home/widgets/most_popular_cart.dart';

import '../../../../data/model/organization_response/organization_details_response.dart';

class OrganizationCourses extends StatelessWidget {
  final OrganizationDetailsModel? organizationDetailsResponse;

  const OrganizationCourses({super.key, this.organizationDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount:
            organizationDetailsResponse?.data?.organization?.courses?.length ??
                0,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisExtent: 280.h,
            mainAxisSpacing: 16.h),
        itemBuilder: (context, index) {
          final data =
              organizationDetailsResponse?.data?.organization?.courses?[index];
          return CoursesCart(
            assetImage: data?.image ?? '',
            title: data?.title ?? '',
            price: data?.rating.toString() ?? '',
            id: data?.id,
            review: 3,
            isBookmark: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseDetailsScreen(id: data?.id)));
            },
          );
        });
  }
}
