import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/course_details_response/course_details_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/course_details_content.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/course_details_shimmer.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_provider.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatelessWidget {
  final int? id;

  const CourseDetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseDetailsProvider(id),
      child: Consumer<CourseDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(70.h),
            //   child: CustomAppBar(appBarName: 'details'.tr()),
            // ),
            body: FutureBuilder<CourseDetailsResponse?>(
                future: provider.courseDetailsApi(id),
                builder: (context, state) {
                  if (state.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          CourseDetailsContent(id: id, state: state),
                          // DetailsButtonContent(
                          //   provider: provider,
                          // )
                        ],
                      ),
                    );
                  } else {
                    return const CourseDetailsShimmer();
                  }
                }),
          );
        },
      ),
    );
  }
}
