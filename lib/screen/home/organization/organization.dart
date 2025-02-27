import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/organization/organization_provider.dart';
import 'package:lms/screen/mentor_section/widgets/organization_cart.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_consts.dart';
import '../../drawer/drawer_screen/drawer_screen.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrganizationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          drawer: const AppDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            provider.getSearchValue(value);
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 16.w),
                              hintText: 'search'.tr(),
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.title.withOpacity(0.3),
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: AppColors.border),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/home_page/payment/Vector.png',
                                  scale: 1.5,
                                ),
                              ),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        'assets/home_page/payment/filter_Icon.png',
                        height: 47,
                      )
                    ],
                  ),
                  SizedBox(height: 24.h),
                  OrganizationCart(organizationResponse: provider.organizationResponse),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
