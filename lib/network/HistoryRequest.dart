import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:resocash/models/History.dart';
import 'package:resocash/models/Request.dart';
import 'package:resocash/models/Store.dart';
import 'package:resocash/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryRequest {
  static const String url =
      "http://20.188.105.155:5000/api/v1/Cashings?storeid=";

  static Future<List<HistoryOBJ>> fetchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('jwtToken')!;
    String storeId = await prefs.getString('storeId')!;
    final respone = await http.get(Uri.parse(url + storeId));
    List jsonResponse = json.decode(respone.body);
    return jsonResponse
        .map((request) => new HistoryOBJ.fromJson(request))
        .toList();
  }
}
