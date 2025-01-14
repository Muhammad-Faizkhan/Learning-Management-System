import 'package:flutter/material.dart';
import 'package:xirfadkaab/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:xirfadkaab/data/repository/metors_repository/mentors_profile_details_repository.dart';

import '../../../data/model/organization_response/organization_details_response.dart';
import '../../../data/repository/organization_repository/organizations_details_repository.dart';

class OrganizationDetailsProvider extends ChangeNotifier {
  OrganizationDetailsModel? organizationDetailsResponse;
  String? type = "about";
  int? userResponseId;

  OrganizationDetailsProvider(int? userId) {
    userResponseId = userId;
    getOrganizationDetails();
  }

  // void selectTab(int index) {
  //   int selectTab = index;
  //   switch (selectTab) {
  //     case 0:
  //       mentorsScreenApi("about");
  //       break;
  //     case 1:
  //       mentorsScreenApi("course");
  //       break;
  //     case 2:
  //       mentorsScreenApi(
  //         "badge",
  //       );
  //       break;
  //     case 3:
  //       mentorsScreenApi(
  //         "review",
  //       );
  //       break;

  //     default:
  //   }
  //   notifyListeners();
  // }

  void getOrganizationDetails() async {
    var apiResponse =
        await OrganizationDetailsRepository.getOrganizationDetailsData(
            userResponseId);
    if (apiResponse.success == true) {
      organizationDetailsResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
