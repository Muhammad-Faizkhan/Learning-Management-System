import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class AllAssignmentListCart extends StatelessWidget {
  final String? title;
  final String? details;
  final String? deadline;
  final String? status;
  final Function()? onTap;
  const AllAssignmentListCart(
      {super.key,
      this.deadline,
      this.details,
      this.status,
      this.title,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color(0xff4A43EC).withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title ?? 'not_found'.tr(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: details ?? 'not_found'.tr(),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.body,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(0.5))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   'assets/mentors/time_vector.png',
                          //   height: 20.h,
                          // ),
                          // SizedBox(
                          //   width: 8.w,
                          // ),
                          CustomText(
                            text: "due to $deadline".tr(),
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // NavUtil.navigateScreen(
                      //     context, const AssignmentsDetailsPage(detailsId: ,));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0.w, vertical: 11.h),
                          child: CustomText(
                            text: status ?? "submit".tr(),
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
