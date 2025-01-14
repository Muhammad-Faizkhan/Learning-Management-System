import 'package:flutter/material.dart';
import 'package:xirfadkaab/data/model/assignment_response/assignment_details_response.dart';
import 'package:xirfadkaab/data/repository/assignment_repository/assignment_details_repository.dart';

class AssignmentDetailsProvider extends ChangeNotifier {
  AssignmentDetailsResponse? assignmentResponse;

  AssignmentDetailsProvider(int? detailsId) {
    assignmentApi(detailsId);
  }

  void assignmentApi(int? detailsId) async {
    debugPrint('$detailsId');
    var apiResponse =
        await AssignmentDetailsRepository.getAssignmentDetailsRepositoryData(
            detailsId);
    if (apiResponse.success == true) {
      assignmentResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
