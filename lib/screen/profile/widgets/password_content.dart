import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/screen/profile/edit_profile_screen/edit_profile_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class PasswordContent extends StatefulWidget {
  final EditProfileProvider? provider;
  const PasswordContent({super.key, this.provider});

  @override
  State<PasswordContent> createState() => _PasswordContentState();
}

class _PasswordContentState extends State<PasswordContent> {
  final _passwordFormKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          FromField(
            title: "current_password",
            hintText: "***********",
            controller: widget.provider?.oldPasswordController,
            validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'current_password_is_required'.tr();
              }
              return null;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          // FromField(
          //   title: "New Password",
          //   hintText: "Enter new password",
          // ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'new_password'.tr(),
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: widget.provider?.newPasswordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    hintText: 'enter_new_password'.tr(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.withOpacity(.2),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder()),
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'new_password_is_required'.tr();
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: widget.provider?.confirmPasswordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    hintText: 're_enter_new_password'.tr(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.withOpacity(.2),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder()),
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 're_enter_password_is_required'.tr();
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButtonWidget(
            text: "update".tr(),
            onPressed: () {
              if (_passwordFormKey.currentState!.validate()) {
                widget.provider?.updatePassword(context);
              }
            },
          )
        ],
      ),
    );
  }
}