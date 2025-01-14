import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/widgets/custom_app_bar.dart';

class DetailsTextContent extends StatelessWidget {
  const DetailsTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'text_content'.tr()),
      ),
      body: const Column(
        children: [Text("data")],
      ),
    );
  }
}
