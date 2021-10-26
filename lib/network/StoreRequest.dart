import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:resocash/models/Store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StoreRequest {
  static const String url =
      'http://20.188.105.155:5000/api/v1/Stores?accountID=';
  //static const String storeId = "StoreFPT";
  //static const String storeURL = url + "/" + storeId;

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
    var userData = parseJwt(token);
    var userID = userData['sid'];

    final response = await http.get(Uri.parse(url + userID), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.body.toString());
    var jsonData = jsonDecode(response.body);
    Store store = new Store(jsonData['storeId'], jsonData['brandId'],
        jsonData['storeAddress'], jsonData['storeStatus'], jsonData['areaId']);
    return store;
  }

  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
