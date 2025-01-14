import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:xirfadkaab/data/model/organization_response/organization_details_response.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class OrganizationAboutCart extends StatelessWidget {
  final OrganizationDetailsModel? organizationDetailsResponse;
  const OrganizationAboutCart({super.key, this.organizationDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            organizationDetailsResponse
                        ?.data?.organization?.about?.designation?.isNotEmpty ==
                    true
                ? CustomText(
                    text: organizationDetailsResponse
                            ?.data?.organization?.about?.designation ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )
                : CustomText(
                    text: 'about_not_found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: 'experiences',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
            SizedBox(
              height: 12.h,
            ),
            organizationDetailsResponse?.data?.organization?.about
                        ?.experiences?[0].description?.isNotEmpty ==
                    true
                ? CustomText(
                    text: organizationDetailsResponse?.data?.organization?.about
                            ?.experiences?[0].description ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )
                : CustomText(
                    text: 'no_experiences_found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: '',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
            SizedBox(
              height: 12.h,
            ),
            organizationDetailsResponse?.data?.organization?.about
                        ?.educations?[0].description?.isNotEmpty ==
                    true
                ? CustomText(
                    text: organizationDetailsResponse?.data?.organization?.about
                            ?.educations?[0].description ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.body,
                  )
                : CustomText(
                    text: 'no_data_found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
          ],
        ),
      ),
    );
  }
}
