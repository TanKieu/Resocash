import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resocash/firebase_db/GoogleSignInProvider.dart';
import 'package:resocash/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'network/AccoutLogin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  void _showDialogDeActivating(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Invalid username or password!!"),
          content: new Text("Your account is not valid. Please try again!"),
          actions: <Widget>[
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Colors.blueGrey[600],
      height: 759,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 160,
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Text('SIGN IN TO YOUR ACCOUNT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                fillColor: Colors.blueGrey[600],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: 'Email',
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.blueGrey[600],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                ),
                hintText: 'Password',
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                prefixIcon: const Icon(
                  Icons.lock_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forget password?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            child: SizedBox(
              height: 70,
              width: 500,
              child: TextButton(
                onPressed: () async {
                  final login = new AccountLogin();
                  // return FutureBuilder(
                  //   future: login.accountLogin(
                  //       _usernameController.text, _passwordController.text),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       if (snapshot.data.toString().contains("Invalid")) {
                  //         return Login();
                  //       } else {
                  //         return Home();
                  //       }
                  //     }
                  //     return Login();
                  //   },
                  // );
                  Future<String> loginAccount = login.accountLogin(
                      _usernameController.text, _passwordController.text);
                  // await FutureBuilder(
                  //   future: token,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       if (snapshot.data == 'success') {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => Account()));
                  //       }
                  //     } else if (snapshot.hasError) {
                  //       return Center(
                  //         child: Text('Some thing went wrong'),
                  //       );
                  //     } else {
                  //       return Account();
                  //     }
                  //     return Account();
                  //   },
                  // );
                  loginAccount.whenComplete(() async {
                    final prefs = await SharedPreferences.getInstance();
                    String? token = prefs.getString('jwtToken');
                    if (token != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (context) => Container(
                      //           child: Text('Invalid user'),
                      //         ));
                      _showDialogDeActivating(context);
                    }
                  });
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.grey),
                    )),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          //   child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Don't have an account? Sign Up",
          //         style: TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white),
          //       )),
          // ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
              child: Text(
                '-------- OR -------',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Colors.white),
                      primary: Colors.blueGrey[600],
                      onPrimary: Colors.white,
                      minimumSize: const Size(90, 50)),
                  onPressed: () {
                    final provider = GoogleSignInProvider();
                    provider.googleLogin();
                  },
                  icon: const FaIcon(FontAwesomeIcons.google),
                  label: const Text('Sign In with Google'))
            ],
          ),
        ],
      ),
    )));
  }
}
