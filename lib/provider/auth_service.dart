import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/api/api.dart';
import 'package:food_app/model/resturnte.dart';

class AuthService with ChangeNotifier {
  ApiProvider _api = ApiProvider.instance;
  List<Restaurants> restaurantsList = [];
  Future<void> getRestaurants() async {
    print("function model");
    restaurantsList = await _api.getRestaurants();
  }
}
