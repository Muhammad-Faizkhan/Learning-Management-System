import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/forget_password/forget_password_provider.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetPasswordProvider(),
      child: Consumer<ForgetPasswordProvider>(builder: (context, provider, _) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText(
                    text: 'forget_password',
                    color: AppColors.title,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/auth_image/foget_pass_img.png',
                      height: 200.h,
                      width: 241.sp,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText(
                    text: 'please_write_down_your_email_to_reset_your_password'
                        .tr(),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ////Email/phone from field////
                  FromField(
                    controller: provider.emailController,
                    title: "email".tr(),
                    hintText: 'write_your_email_or_phone'.tr(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButtonWidget.ElevatedButtonWidget(
                    onPressed: () {
                      provider.forgetPasswordApi(context);
                    },
                    text: "submit",
                  )
                ],
              ),
            ),
          )),
        );
      }),
    );
  }
}
