import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lms/data/repository/organization_repository/organization_repository.dart';
import '../../../data/model/organization_response/organizetion_model.dart';

class OrganizationProvider extends ChangeNotifier {
  OrganizationModel? organizationResponse;
  String search = "";
  Timer? timeHandle;
  String? type = "instractors";

  OrganizationProvider() {
    getOrganization(type, search);
  }
  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }

    timeHandle = Timer(const Duration(seconds: 1), () {
      getOrganization(type, search);
      notifyListeners();
    });

    //print("controller page $searchCode");
  }

  // void selectTab(int index) {
  //   int selectTab = index;
  //   switch (selectTab) {
  //     case 0:
  //       mentorsScreenApi("instractors", search);
  //       type = "instractors";
  //       notifyListeners();
  //       break;
  //     case 1:
  //       mentorsScreenApi("organizations", search);
  //       type = "organizations";
  //       notifyListeners();
  //       break;
  //     case 2:
  //       mentorsScreenApi("consultations", search);
  //       type = "instractors";
  //       notifyListeners();
  //       break;
  //     default:
  //   }
  // }

  void getOrganization(String? type, String? search) async {
    var apiResponse =
    await OrganizationRepository.getOrganizationData(type, search);

    if (apiResponse.success == true) {
      organizationResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
