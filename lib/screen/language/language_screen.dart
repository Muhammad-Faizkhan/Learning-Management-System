import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/screen/home/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isChecked = false;
  int selectedIndex = 0;
  List languages = [
    {
      'name': 'English',
      'image':
          'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQVhwOar0FyOb_mmItcTAQFv1O4k8S_ZUEAI45O7dYC2rXRUWD-nWJwOQWJS2va8krELcDtY0JEVdQabkDkEdo',
    },
    {
      'name': 'Bangla',
      'image':
          'https://cdn.britannica.com/67/6267-004-10A21DF0/Flag-Bangladesh.jpg',
    },
    {
      'name': 'Arabic',
      'image':
          'https://cdn.britannica.com/79/5779-004-DC479508/Flag-Saudi-Arabia.jpg',
    },
    {
      'name': 'Spanish',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLsWHAAWo4c5g6x6kf9gbnjHprZ_IREhR4707Zc48KGg&s',
    },
    {
      'name': 'Hindi',
      'image':
          'https://i.pinimg.com/originals/ea/14/0a/ea140a9f6e4681b64b35262cf873f026.png',
    },
    {
      'name': 'French',
      'image':
          'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/255px-Flag_of_France.svg.png',
    }
  ];

  @override
  initState() {
    getSelectedLanguage();
    super.initState();
  }

  getSelectedLanguage() async {
    var selectedLanguage =
        await SPUtill.getSelectLanguage(SPUtill.keySelectLanguage);
    if (kDebugMode) {
      print("selectedLanguage Local: $selectedLanguage");
    }
    if (selectedLanguage != null) {
      setState(() {
        selectedIndex = selectedLanguage;
        if (kDebugMode) {
          print("selectedIndex sssss: $selectedLanguage");
        }
      });
    } else {
      setState(() {
        selectedIndex = 0;
        if (kDebugMode) {
          print("selectedIndex deflt: $selectedIndex");
        }
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const BottomNavBar()),
                      (Route<dynamic> route) => true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Lottie.asset('assets/home_page/language_lottie.json',
                        height: 100, width: 100),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text('choose_your_preferred_language',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54))
                        .tr(),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "please_select_your_language",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: languages.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                SPUtill.setLanguageIntValue(
                                    SPUtill.keySelectLanguage, selectedIndex);
                                if (kDebugMode) {
                                  print(selectedIndex);
                                }
                                if (selectedIndex == 0) {
                                  context.setLocale(const Locale('en', 'US'));
                                } else if (selectedIndex == 1) {
                                  context.setLocale(const Locale('bn', 'BN'));
                                } else if (selectedIndex == 2) {
                                  context.setLocale(const Locale('ar', 'AR'));
                                } else if (selectedIndex == 3) {
                                  context.setLocale(const Locale('es', 'ES'));
                                } else if (selectedIndex == 4) {
                                  context.setLocale(const Locale('en', 'IN'));
                                } else if (selectedIndex == 5) {
                                  context.setLocale(const Locale('fr', 'FR'));
                                }
                                getSelectedLanguage();
                              });
                            },
                            child: Row(
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                    imageUrl: "${languages[index]['image']}",
                                    placeholder: (context, url) => Center(
                                      child: Image.asset(
                                          "assets/onboarding/logoxirfadkaab.jpg"),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  languages[index]['name'] ?? "",
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: selectedIndex == index ? 30 : 0,
                                  width: selectedIndex == index ? 30 : 0,
                                  child: Icon(
                                    Icons.check,
                                    size: selectedIndex == index ? 24 : 0,
                                    color: Colors.blue.withOpacity(
                                        selectedIndex == index ? 0.85 : 0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
