// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/utils/app_consts.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String? text;
  final Function()? onPressed;

  ElevatedButtonWidget.ElevatedButtonWidget(
      {super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: AppColors.primary,
            elevation: 4,
          ),
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(
                letterSpacing: 1.sp,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ).tr()),
    );
  }
}
