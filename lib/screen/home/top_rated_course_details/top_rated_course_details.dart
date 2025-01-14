import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/widgets/top_rated_content.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:xirfadkaab/widgets/search_field.dart';

class TopRatedCourseDetails extends StatelessWidget {
  const TopRatedCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'top_rated_courses'.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.w),
          child: Column(
            children: [
              const SearchField(),
              SizedBox(
                height: 36.h,
              ),
              const TopRatedContent(),
              SizedBox(
                height: 25.h,
              ),
              const TopRatedContent(),
              SizedBox(
                height: 25.h,
              ),
              const TopRatedContent(),
            ],
          ),
        ),
      ),
    );
  }
}
