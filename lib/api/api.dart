import 'dart:convert';

import 'package:food_app/model/resturnte.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();

  //
  static const Map<String, String> apiHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json, text/plain, */*",
  };

  Future<List<Restaurants>> getRestaurants() async {
//    UserModel user = UserModel();

    // Json Data

    print('getProfile start');
    // Http Request
    http.Response _response = await http.get(
      'http://appback.ppu.edu/restaurants',
      headers: {
        ...apiHeaders,
      },
    );
    print('getProfile start.0000');
    print(_response.body);

    // Decoding Response.
    var decoded = json.decode(_response.body);

    // Response Handling
    if (_isValidResponse(_response.statusCode)) {
      // OK
      print("_response.statusCode" + _response.statusCode.toString());
      // return UserModel.fromJsonGetProfile(decoded);
      final loadData = json.decode(_response.body);
      List<Restaurants> restaurantsList = [];
      for (int i = 0; i < loadData.length; i++) {
        restaurantsList.add(Restaurants.fromJson(loadData[i]));
      }

      return restaurantsList;
    } else {
      // No Success
      // throw ApiException.fromApi(_response.statusCode, decoded);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Helpers Functions /////////////////////////////

bool _isValidResponse(int statusCode) {
  return statusCode >= 200 && statusCode <= 302;
}
