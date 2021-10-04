import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resocash/home.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasData){
          return Home();
        }else if (snapshot.hasError){
          return Center(child: Text('Some thing went wrong'),);
        }else{
          return Login();
        }
      },
    )
  );
}