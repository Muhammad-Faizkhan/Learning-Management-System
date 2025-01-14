import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/course_details/payment_list/payment_method_provider.dart';
import 'package:xirfadkaab/screen/home/course_details/widgets/add_card_cart.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  final int? courseId;
  const PaymentMethod({super.key, this.courseId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentMethodProvider(),
      child: Consumer<PaymentMethodProvider>(
        builder: (context, provider, _) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: CustomAppBar(appBarName: 'payment_method'.tr()),
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider
                              .paymentListResponse?.data?.payments?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            provider.getPaymentRequestApi(
                                context,
                                provider.userId,
                                courseId,
                                provider.paymentListResponse?.data
                                    ?.payments?[index].name);
                          },
                          child: PaymentListCart(
                            image: provider.paymentListResponse?.data
                                    ?.payments?[index].image ??
                                "",
                            text: provider.paymentListResponse?.data
                                    ?.payments?[index].title ??
                                "",
                            cardNumber: provider.paymentListResponse?.data
                                    ?.payments?[index].name ??
                                "",
                          ),
                        );
                      }),
                ],
              ));
        },
      ),
    );
  }
}
