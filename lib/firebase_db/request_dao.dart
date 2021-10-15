import 'package:firebase_core/firebase_core.dart';
import 'package:resocash/models/Request.dart';
import 'package:firebase_database/firebase_database.dart';

class RequestDao {
  final DatabaseReference _requestRef =
      FirebaseDatabase.instance.reference().child('request');

  void createRequest(RequestService request) {
    _requestRef.push().set(request.toJson());
  }
}
