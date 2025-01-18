import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/screen/drawer/settings/about_us/about_us_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:xirfadkaab/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AboutUsProvider(),
      child: Consumer<AboutUsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: 'about_us'.tr()),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/onboarding/logoxirfadkaab.jpg',
                        height: 74.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: provider.aboutUsResponse?.data?.value ??
                          "Kusoo dhawoow Xirfadkaab College\n\n"
                              "XirfadKaab waa kuleej caalami ah oo bixiya tababaro iyo Diploomooyin ku saabsan farsamooyinka Tiknoolajiyada, Luuqadaha, Maamulka iyo Ganacsiga.\n\n"
                              "Doorashada xirfad shaqo iyo horumarinta noloshaada waa yoolka yaga koobaad.\n\n"
                              "Wax ka ogow Xirfadkaab College\n\n"
                              "Casharo Maqal iyo Muuqaal ah\n\n"
                              "100% Practical Itus oo itaabsii ah\n\n"
                              "Live classyo iyo helid shahaado\n\n"
                              "Takhasusyada aan Tababarada ka bixino\n"
                              "- Business & Management\n"
                              "- Computer Application\n"
                              "- Cyber Security\n"
                              "- Database Administration\n"
                              "- Nework Engineer\n"
                              "- System Administration\n"
                              "- Software Development Development\n"
                              "- Languages\n"
                              "- Personal Development",
                      color: AppColors.body,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
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
