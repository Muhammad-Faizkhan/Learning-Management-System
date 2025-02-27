import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class NoResultFoundCart extends StatelessWidget {
  const NoResultFoundCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'no_result_found'.tr(),
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.title),
        ),
        SizedBox(
          height: 70.h,
        ),
        Center(
          child: Image.asset(
            'assets/home_page/payment/no_result_found.png',
            height: 120.h,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Center(
          child: Text(
            'no_result_found'.tr(),
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.title),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Center(
          child: Text(
            'please_enter_another_keyword'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5,
                letterSpacing: 1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.body),
          ),
        ),
      ],
    );
  }
}
