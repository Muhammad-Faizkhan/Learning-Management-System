import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class CourseTitle extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CourseTitle({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title!,
          color: AppColors.title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: CustomText(
            text: "see_all".tr(),
            color: AppColors.body,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
