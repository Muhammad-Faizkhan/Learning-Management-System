import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/category/featured_category.dart';
import 'package:xirfadkaab/screen/home/category/see_all_category/see_all_category.dart';
import 'package:xirfadkaab/screen/home/home_screen/home_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';

class FeaturedContent extends StatelessWidget {
  final HomeProvider? provider;
  const FeaturedContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text:
                    // provider.categories?.title ??
                    "featured_category".tr(),
                color: AppColors.title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SeeAllCategory(),
                      ));
                },
                child: CustomText(
                  text: "see_all",
                  color: AppColors.body,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
          FeaturedCategory(
            categories: provider?.categories,
          ),
        ],
      ),
    );
  }
}
