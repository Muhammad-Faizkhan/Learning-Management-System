import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/auth/widgets/text_form_field.dart';
import 'package:xirfadkaab/screen/profile/edit_profile_screen/edit_profile_provider.dart';
import 'package:xirfadkaab/widgets/elevated_button_widget.dart';

class BasicInfoContent extends StatelessWidget {
  final EditProfileProvider? provider;
  const BasicInfoContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "full_name",
          hintText: "write_your_full_name".tr(),
          controller: provider?.editNameController,
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "email_address".tr(),
          hintText: "write_your_email_address",
          controller: provider?.emailEditController,
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "phone_number".tr(),
          hintText: "+01 | 023-6894-523",
          controller: provider?.phoneEditController,
        ),
        SizedBox(
          height: 24.h,
        ),
        // FromField(
        //     controller: provider?.dateEditController,
        //     title: "Date of Birth",
        //     hintText: "23-06-1995",
        //     suffixIcon: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.calendar_today_outlined))),
        InkWell(
          onTap: () => provider?.selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider?.joinDateEdit != null
                      ? "${provider?.joinDateEdit!.toLocal()}".split(" ")[0]
                      : "${provider?.userDateOfBirth}".split(" ")[0],
                  style: const TextStyle(fontSize: 14),
                ),
                const Icon(Icons.date_range_outlined)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        ElevatedButtonWidget(
          text: "update".tr(),
          onPressed: () {
            provider?.editProfileInfo(context);
          },
        )
      ],
    );
  }
}
