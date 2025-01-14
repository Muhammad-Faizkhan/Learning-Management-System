import 'package:flutter/material.dart';
import 'package:xirfadkaab/data/model/cart_response/cart_screen_response.dart';
import 'package:xirfadkaab/data/repository/cart_repository/cart_screen_repository.dart';

class CartScreenProvider extends ChangeNotifier {
  CartResponse? cartResponse;

  CartScreenProvider() {
    cartScreenApi();
  }
  void cartScreenApi() async {
    var apiResponse = await CartScreenRepository.getCartScreenRepositoryData();
    if (apiResponse.success == true) {
      cartResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
