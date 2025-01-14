import 'package:flutter/material.dart';
import 'package:lms/data/model/dashbaord_response/dashboard_response.dart';
import 'package:lms/data/model/profile_response/profile_response.dart';
import 'package:lms/data/repository/dashboard_repository/dashboard_repository.dart';
import 'package:lms/data/repository/profile_repository/profile_repository.dart';
import 'package:lms/utils/shared_preferences.dart';

class DashboardScreenProvider extends ChangeNotifier {
  ProfileResponse? profileResponse;
  DashboardResponse? dashboardResponse;
  String? userName;
  String? userAvatar;
  String? userJoinDate;
  bool _isActive = true; // Flag to track if the provider is active

  DashboardScreenProvider() {
    getUserData();
    myProfileApi();
    dashboardapi();
  }
  @override
  void dispose() {
    _isActive = false; // Set the flag to false when disposed
    super.dispose();
  }

  void myProfileApi() async {
    var apiResponse = await ProfileRepository.getProfileRepositoryData();

    if (apiResponse.success == true) {
      if (_isActive) {
        // Check if the provider is still active
        profileResponse = apiResponse.data;
        notifyListeners();
      }
    }
  }

  void getUserData() async {
    userName = await SPUtill.getValue(SPUtill.keyName);
    userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
    userJoinDate = await SPUtill.getValue(SPUtill.keyJoinDate);

    if (_isActive) {
      // Check if the provider is still active
      notifyListeners();
    }
  }

  void dashboardapi() async {
    var apiResponse = await DashboardRepsitory.getDashboardRepsitoryData();

    if (apiResponse.success == true) {
      if (_isActive) {
        // Check if the provider is still active
        dashboardResponse = apiResponse.data;
        notifyListeners();
      }
    }
  }
}
