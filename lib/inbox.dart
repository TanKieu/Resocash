import 'package:flutter/material.dart';
import 'package:resocash/account.dart';
import 'package:resocash/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './navigator.dart';
import './request.dart';
import 'main.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Inbox',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever_outlined))
                    ],
                  ),
                )
              ],
              backgroundColor: Colors.white10,
              bottom: const TabBar(
                indicatorColor: Colors.lightBlue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Chats',
                  ),
                  Tab(
                    text: 'Notifications',
                  )
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Request()),
              );
            },
            tooltip: 'Create Request',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Navigate(
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Activity()),
                );
              },
              () {},
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
              })),
    );
  }
}
