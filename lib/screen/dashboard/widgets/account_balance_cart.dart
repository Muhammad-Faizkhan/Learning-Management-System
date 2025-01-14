import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/data/model/dashbaord_response/dashboard_response.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class AccountBalanceCart extends StatelessWidget {
  final DashboardResponse? dashboardResponse;
  const AccountBalanceCart({super.key, this.dashboardResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff4A43EC).withOpacity(0.2))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: dashboardResponse?.data?.purchaseAmounts.toString() ??
                      '0',
                  color: AppColors.title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 9.h,
                ),
                CustomText(
                  text: "account_balance".tr(),
                  color: AppColors.title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/mentors/payment.png',
              height: 53,
            )
          ],
        ),
      ),
    );
  }
}
