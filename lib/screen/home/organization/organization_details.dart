import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/data/model/mentors_response/mentors_response.dart';
import 'package:xirfadkaab/screen/home/organization/organization_details_provider.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/Instractor_info_content.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/badges_cart.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/mentors_courses.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/organization_about_cart.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/mentors_profile_details_provider.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/about_cart.dart';
import 'package:xirfadkaab/screen/mentor_section/mentors_profile_details/components/reviews_cart.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../mentor_section/mentors_profile_details/components/organization_courses.dart';
import '../../mentor_section/mentors_profile_details/components/organization_info_cart.dart';
import '../../mentor_section/mentors_profile_details/components/organization_review_cart.dart';

class OrganizationDetails extends StatefulWidget {
  final int? usersId;

  const OrganizationDetails({super.key, required this.usersId});

  @override
  State<OrganizationDetails> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetails>
    with SingleTickerProviderStateMixin {
  List<String> examType = ["About", "Courses", "Badges", "Reviews"];
  var selectedIndex = 0;
  ScrollController? _scrollViewController;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrganizationDetailsProvider(widget.usersId),
      child: Consumer<OrganizationDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: CustomAppBar(appBarName: 'profile'.tr()),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  controller: _scrollViewController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: OrganizationInfoContent(
                          provider: provider,
                          users: provider
                              .organizationDetailsResponse?.data?.organization),
                    ),
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      elevation: 8.0,
                      shadowColor: Colors.white,
                      pinned: true,
                      floating: true,
                      snap: false,
                      collapsedHeight: 56.0001,
                      expandedHeight: 50.0,
                      clipBehavior: Clip.hardEdge,
                      flexibleSpace: FlexibleSpaceBar.createSettings(
                        currentExtent: 0,
                        minExtent: 0,
                        maxExtent: 0,
                        child: Wrap(
                          children: List.generate(
                            examType.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 6),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? AppColors.primary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CustomText(
                                  text: examType[index],
                                  fontSize: 14.sp,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xff9F9F9F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    selectedIndex == 0
                        ? OrganizationAboutCart(
                            organizationDetailsResponse:
                                provider.organizationDetailsResponse,
                          )
                        : selectedIndex == 1
                            ? OrganizationCourses(
                                organizationDetailsResponse:
                                    provider.organizationDetailsResponse,
                              )
                            : selectedIndex == 2
                                ? const BadgesCart()
                                : selectedIndex == 3
                                    ? OrganizationCart(
                                        organizationDetailsResponse: provider
                                            .organizationDetailsResponse,
                                      )
                                    : const SizedBox(),
                  ],
                ),
              )

              // SingleChildScrollView(
              //   child: Padding(
              //     padding:
              //         EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
              //     child: Column(
              //       children: [
              //         InstructorInfoContent(
              //             provider: provider, users: widget.users),
              //         Center(
              //           child: Column(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   color: Colors.white,
              //                 ),
              //                 child: TabBar(
              //                     // onTap: (int index) {
              //                     //   provider.selectTab(index);
              //                     // },
              //                     unselectedLabelColor: AppColors.body,
              //                     indicatorColor: AppColors.primary,
              //                     labelColor: AppColors.primary,
              //                     labelStyle: TextStyle(
              //                         fontSize: 14.sp,
              //                         fontWeight: FontWeight.w700),
              //                     tabs: const [
              //                       Tab(
              //                         text: 'About',
              //                       ),
              //                       Tab(
              //                         text: 'Courses',
              //                       ),
              //                       // Tab(
              //                       //   text: 'Badges',
              //                       // ),
              //                       Tab(
              //                         text: 'Reviews',
              //                       ),
              //                     ],
              //                     controller: _tabController,
              //                     indicatorSize: TabBarIndicatorSize.tab),
              //               ),
              //               SizedBox(
              //                 height: 298.h,
              //                 child: TabBarView(
              //                     physics: const NeverScrollableScrollPhysics(),
              //                     controller: _tabController,
              //                     children: [
              //                       AboutCart(
              //                           mentorsDetailsResponse:
              //                               provider.mentorsDetailsResponse),
              //                       Padding(
              //                         padding: const EdgeInsets.all(16.0),
              //                         child: MentorsCourses(
              //                           mentorsDetailsResponse:
              //                               provider.mentorsDetailsResponse,
              //                         ),
              //                       ),
              //                       // BadgesCart(
              //                       //     mentorsDetailsResponse:
              //                       //         provider.mentorsDetailsResponse),
              //                       ReviewsCart(
              //                         mentorsDetailsResponse:
              //                             provider.mentorsDetailsResponse,
              //                       )
              //                     ]),
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              );
        },
      ),
    );
  }
}
