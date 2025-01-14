import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  String? image;
  String? title;
  String? discription;

  OnboardingModel({this.image, this.title, this.discription});
}

List<OnboardingModel> contents = [
  OnboardingModel(
      title: 'lets_explore_been_looking_for'.tr(),
      image: 'assets/onboarding/onboarding_one.png',
      discription: "create_a_unique_emotional_story".tr()),
  OnboardingModel(
      title: 'connect_updates'.tr(),
      image: 'assets/onboarding/onboarding_two.png',
      discription: "create_words".tr()),
  OnboardingModel(
      title: 'scroll_courses'.tr(),
      image: 'assets/onboarding/onboarding_three.png',
      discription: "create_a_unique_words".tr()),
];
