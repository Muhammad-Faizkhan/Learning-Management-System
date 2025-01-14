import 'package:flutter/material.dart';
import 'package:xirfadkaab/data/model/slider_response/slider_details_response.dart';
import 'package:xirfadkaab/data/repository/slider_repository/slider_repository.dart';

class SliderListProvider extends ChangeNotifier {
  SliderDetailsResponse? sliderDetailsResponse;

  SliderListProvider(int? sliderId) {
    getSliderList(sliderId);
  }

  void getSliderList(int? sliderId) async {
    var apiResponse = await SliderRepository.getSliderDetailsApi(sliderId);
    if (apiResponse.success == true) {
      sliderDetailsResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
