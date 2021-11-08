import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resocash/home.dart';
import 'package:resocash/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountLogin extends ChangeNotifier {
  String loginUrl = "http://20.188.105.155:5000/api/Login/author?";

  Future<String> accountLogin(String email, String password) async {
    final res = await http.post(
      Uri.parse(loginUrl + 'email=' + email + '&password=' + password),
      headers: {"Content-type": "application/json;charset=utf-8"},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print(body);
      if (body['token'].contains('Invalid')) {
        return 'fail';
      } else {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwtToken', body['token']);
      }
      return 'success';
      notifyListeners();
    }
    return 'success';
  }
}
