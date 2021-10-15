import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resocash/GoogleSignInProvider.dart';
import 'package:resocash/home.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String token = "";
  late Future googleProvider;

  @override
  void initState() {
    super.initState();
  }

  void _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('jwtToken')!;
    print(token);
  }

  void _delToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('jwtToken');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            googleProvider = GoogleSignInProvider().googleLogin();
            return FutureBuilder(
                future: googleProvider,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString().contains("Invalid")) {
                      _delToken();
                      return Login();
                    } else {
                      return Home();
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Some thing went wrong'),
                    );
                  } else {
                    return Login();
                  }
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Some thing went wrong'),
            );
          } else {
            return Login();
          }
        },
      ));
}
