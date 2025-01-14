import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/drawer/settings/about_us/about_us_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AboutUsProvider(),
      child: Consumer<AboutUsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: 'about_us'.tr()),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/onboarding/logoxirfadkaab.jpg',
                    height: 74.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: provider.aboutUsResponse?.data?.value ?? "",
                    color: AppColors.body,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
