import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:resocash/models/Store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StoreRequest {
  static const String url = 'http://20.188.105.155:5000/api/v1/stores';
  static const String storeId = "StoreFPT";
  static const String storeURL = url + "/" + storeId;

  static Store parseStore(String responseBody) {
    var jsonData = jsonDecode(responseBody);
    Store store = Store(jsonData['storeId'], jsonData['brandId'],
        jsonData['storeAddress'], jsonData['storeStatus'], jsonData['areaId']);
    return store;
  }

  static Future<Store> fetchStore() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('jwtToken')!;
    print(token);
    final response = await http.get(Uri.parse(storeURL), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.body.toString());
    var jsonData = jsonDecode(response.body);
    Store store = new Store(jsonData['storeId'], jsonData['brandId'],
        jsonData['storeAddress'], jsonData['storeStatus'], jsonData['areaId']);
    return store;
  }
}
