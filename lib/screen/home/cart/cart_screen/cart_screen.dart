import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/screen/home/cart/cart_screen/cart_screen_provider.dart';
import 'package:lms/screen/home/cart/components/cart_screen_design.dart';
import 'package:lms/screen/home/course_details/payment_list/payment_method.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/bookmark_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartScreenProvider(),
      child: Consumer<CartScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: BookmarkAppBar(appBarName: 'add_to_cart'.tr()),
            ),
            body: provider.cartResponse?.data?.cart?.items?.isEmpty ??
                    true == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: true,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "no_cart_available".tr(),
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            )),
                      )
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.0.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.cartResponse?.data?.cart
                                      ?.items?.length ??
                                  0,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = provider
                                    .cartResponse?.data?.cart?.items?[index];
                                return CartScreenDesign(
                                  cartResponse: data,
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => CourseDetailsScreen(
                                    //           id: provider.bookmarkResponse?.data
                                    //               ?.favorites?[index].id),
                                    //     ));
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomText(
                            text: 'total'.tr(),
                            color: AppColors.title,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomText(
                            text:
                                "\$${provider.cartResponse?.data?.cart?.amounts?.total.toString() ?? ''}",
                            color: AppColors.secondary,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${provider.cartResponse?.data?.cart?.amounts?.subTotal.toString() ?? ''}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.body,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Text(
                                "${provider.cartResponse?.data?.cart?.amounts?.totalDiscount.toString() ?? ''}\$ off",
                                style: TextStyle(
                                  color: AppColors.title,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButtonWidget.ElevatedButtonWidget(
                            text: "checkout".tr(),
                            onPressed: () {
                              NavUtil.navigateScreen(
                                  context, const PaymentMethod());
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
