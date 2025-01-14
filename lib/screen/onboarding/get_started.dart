import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/auth/login_screen/login_screen.dart';
import 'package:xirfadkaab/screen/onboarding/widgets/social_login_widget.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: "get_started".tr(),
                color: AppColors.title,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
              Image.asset(
                'assets/onboarding/get_started.png',
                height: 374.h,
                width: 374.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.h,
              ),
              SocialLoginWidget(
                assetImage: "assets/onboarding/apple_vector.png",
                text: "continue_with_apple".tr(),
                bgColour: AppColors.title,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 12.h,
              ),
              SocialLoginWidget(
                assetImage: "assets/onboarding/fb_vector.png",
                text: "continue_with_facebook".tr(),
                bgColour: AppColors.primaryBg,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 12.h,
              ),
              SocialLoginWidget(
                assetImage: "assets/onboarding/google_vector.png",
                text: "continue_with_google".tr(),
                bgColour: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already_have_an_account'.tr(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subTiltle),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ));
                    },
                    child: Text(
                      'sign_in'.tr(),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
