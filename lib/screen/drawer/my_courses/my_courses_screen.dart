import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:xirfadkaab/screen/profile/my_profile_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/utils/nav_utail.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
      child: Consumer<MyProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: 'my_courses'.tr()),
            ),
            body: provider.profileResponse?.data?.enrolls?.courses.isEmpty ??
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
                              "my_course_not_found".tr(),
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
                      padding: const EdgeInsets.all(22.0),
                      child: GridView.builder(
                        itemCount: provider.profileResponse?.data?.enrolls
                                ?.courses.length ??
                            0,
                        itemBuilder: (context, index) {
                          final data = provider
                              .profileResponse?.data?.enrolls?.courses[index];
                          return InkWell(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context,
                                  // CourseDetailsScreen(
                                  //   id: data?.id,
                                  // )
                                  CourseDetailsWebView(
                                    courseId: data?.id,
                                    userId: provider.userId,
                                  ));
                            },
                            child: Card(
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    height: 135.h,
                                    fit: BoxFit.cover,
                                    imageUrl: data?.image ?? '',
                                    placeholder: (context, url) => Center(
                                      child: Image.asset(
                                          "assets/home_page/ic_no_image.png"),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            "assets/home_page/ic_no_image.png"),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          maxLine: 2,
                                          text: data?.title ?? '',
                                          color: AppColors.title,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/trending_courses/star_vector.png',
                                              height: 13.h,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            CustomText(
                                              text: data?.rate
                                                      ?.toStringAsFixed(2) ??
                                                  '',
                                              color: AppColors.title,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            CustomText(
                                              text:
                                                  '(${data?.reviewCount ?? ''} reviews)'
                                                      .tr(),
                                              color: AppColors.body,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        minimumSize:
                                            Size(double.infinity, 28.h),
                                      ),
                                      onPressed: () {
                                        NavUtil.navigateScreen(
                                            context,
                                            CourseDetailsWebView(
                                              courseId: data?.id,
                                              userId: provider.userId,
                                            ));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const EnroleCourseDetailsPage(),
                                        //     ));
                                      },
                                      child: CustomText(
                                        text: "play_now".tr(),
                                        color: AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                  // Expanded(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       CustomText(
                                  //         text: data?.price ?? '',
                                  //         color: AppColors.title,
                                  //         fontSize: 18.sp,
                                  //         fontWeight: FontWeight.w700,
                                  //       ),
                                  //       const Spacer(),
                                  //       const EnroleNowButton()
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 271.h,
                            mainAxisSpacing: 24),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
