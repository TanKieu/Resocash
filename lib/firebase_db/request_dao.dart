import 'package:firebase_core/firebase_core.dart';
import 'package:resocash/models/Request.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestDao {
  final DatabaseReference _requestRef =
      FirebaseDatabase.instance.reference().child('request');

  String createRequest(RequestService request) {
    String key = _requestRef.push().key;
    _requestRef.child(key).set(request.toJson());
    print(key);
    return key;
  }

  void updateRequest(RequestService request, String key) {
    _requestRef.child(key).set(request.toJson());
  }

  Query getRequestQuery(String key) {
    return _requestRef.orderByKey().equalTo(key);
  }
}
