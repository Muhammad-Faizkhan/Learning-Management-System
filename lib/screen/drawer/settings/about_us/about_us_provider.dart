import 'package:flutter/material.dart';
import 'package:xirfadkaab/data/model/about_us_response/about_us_response.dart';
import 'package:xirfadkaab/data/repository/about_us_repository/about_us_repository.dart';

class AboutUsProvider extends ChangeNotifier {
  AboutUsResponse? aboutUsResponse;

  AboutUsProvider() {
    aboutUsApi();
  }
  void aboutUsApi() async {
    var apiResponse = await AboutUsRepository.getAboutUsRepositoryData();

    if (apiResponse.success == true) {
      aboutUsResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
