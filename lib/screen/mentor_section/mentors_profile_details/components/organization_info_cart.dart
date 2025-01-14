import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/organization/organization_details_provider.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/mentors_profile_details_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';
import 'package:xirfadkaab/data/model/mentors_response/mentors_response.dart';

import '../../../../data/model/organization_response/organization_details_response.dart';

class OrganizationInfoContent extends StatelessWidget {
  final Organization? users;
  final OrganizationDetailsProvider? provider;
  const OrganizationInfoContent({super.key, this.provider, this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              gradient: const LinearGradient(
                  colors: [Color(0xff392C7D), Color(0xff314CAD)],
                  stops: [0.3, 7.0])),
          child: Row(
            children: [
              Image.asset(
                'assets/mentors/man vector.png',
                height: 90.h,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: users?.name ?? '',
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 150.w,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  CustomText(
                    text: users?.name ?? '',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  RatingBarIndicator(
                    rating: double.parse("${users?.rating ?? 0.0}"),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/mentors/courses_vector.png',
                      height: 52.h,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      text: provider?.organizationDetailsResponse?.data
                              ?.organization?.courseCount
                              .toString() ??
                          '',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title,
                    ),
                    CustomText(
                      text: 'courses'.tr(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/mentors/student_vector.png',
                      height: 52.h,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      text: provider?.organizationDetailsResponse?.data
                          ?.organization?.studentsCount
                          .toString(),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title,
                    ),
                    CustomText(
                      text: 'student'.tr(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/mentors/global_vector.png',
                      height: 52.h,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      text: provider?.organizationDetailsResponse?.data
                              ?.organization?.studentsCount
                              .toString() ??
                          '',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title,
                    ),
                    CustomText(
                      text: 'Global Sale',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
