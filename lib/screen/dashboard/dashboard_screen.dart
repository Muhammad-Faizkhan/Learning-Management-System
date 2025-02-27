import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/dashboard/dashboard_screen_provider.dart';
import 'package:lms/screen/dashboard/widgets/account_balance_cart.dart';
import 'package:lms/screen/dashboard/widgets/summary_cart.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardScreenProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SummaryCart(
                          image: "assets/home_page/dash_one.png",
                          total: provider.dashboardResponse?.data?.courseCount
                                  .toString() ??
                              '',
                          type: "courses".tr(),
                          title: "courses_count".tr(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: SummaryCart(
                          image: "assets/home_page/dash_two.png",
                          total: provider
                                  .dashboardResponse?.data?.purchaseAmounts
                                  .toString() ??
                              "",
                          type: "purchase".tr(),
                          title: "purchase_count".tr(),
                        ),
                      ),
                    ],
                  ),
                  // SummaryContent(
                  //     dashboardResponse: provider.dashboardResponse),
                  SizedBox(
                    height: 20.h,
                  ),
                  AccountBalanceCart(
                      dashboardResponse: provider.dashboardResponse),
                  SizedBox(
                    height: 34.h,
                  ),
                  CustomText(
                    text: "assignment".tr(),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        provider.dashboardResponse?.data?.assignments?.length ??
                            0,
                    itemBuilder: (context, index) {
                      final data =
                          provider.dashboardResponse?.data?.assignments?[index];
                      return AllAssignmentListCart(
                        title: data?.title,
                        details: data?.details,
                        status: data?.status,
                        deadline: data?.deadline,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
