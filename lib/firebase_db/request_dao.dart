import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:resocash/models/Request.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RequestDao {
  final DatabaseReference _requestRef =
      FirebaseDatabase.instance.reference().child('request');
  final String requestURL = "http://20.188.105.155:5000/api/v1/Cashings";

  Future createRequest(RequestService request) async {
    // String key = _requestRef.push().key;
    // _requestRef.child(key).set(request.toJson());
    // print(key);
    // return key;
    // String requestID =
    //     request.storeId + request.areaId + DateTime.now().toString();
    // request.requestID = requestID;
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('key', requestID);
    print(request.toJson());
    final res = await http.post(
      Uri.parse(requestURL),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );
    print(res.statusCode);
    // return requestID;
  }

  void updateRequest(RequestService request, String key) {
    _requestRef.child(key).set(request.toJson());
  }

  Query getRequestQuery(String key) {
    return _requestRef.orderByKey().equalTo(key);
  }
}
