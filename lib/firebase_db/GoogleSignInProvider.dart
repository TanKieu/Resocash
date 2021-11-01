import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  String loginUrl = 'http://20.188.105.155:5000/api/Login/googleAccount';

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    String token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final res = await http.get(Uri.parse(loginUrl), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    var body = jsonDecode(res.body);
    if (body['token'].contains('Invalid')) {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('jwtToken', body['token']);
    }
    return body['token'];
    notifyListeners();
  }

  Future logout() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('jwtToken');
    notifyListeners();
  }
}
