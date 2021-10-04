import 'package:flutter/material.dart';
import 'package:resocash/activity.dart';
import 'package:resocash/icons/doc_icon.dart';
import './navigator.dart';
import './request.dart';
import './activity.dart';
import './inbox.dart';
import 'GoogleSignInProvider.dart';
import 'main.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  color: Colors.lightBlue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, left: 12.0, bottom: 12.0, right: 3.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.amberAccent,
                          child: Text('TK'),
                        ),
                      ),
                      Text(
                        'Store 11234',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 0.3))),
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.description,
                              size: 27,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              'Profile',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 0.3))),
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 27,
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 0.3))),
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.headphones_outlined,
                              size: 27,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              'Help Center',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 0.3),
                            bottom: BorderSide(width: 0.3))),
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.settings,
                                size: 27, color: Colors.black45),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              'Setting',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                  ),
                ]),
                SizedBox(
                  height: 35,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      color: Colors.redAccent[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: FlatButton(
                      onPressed: () {
                        final provider = GoogleSignInProvider();
                        provider.logout();
                        Navigator.pop(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Expanded(
                              child: Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Request()),
            );
          },
          tooltip: 'Create Request',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Navigate(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Activity()),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Inbox()),
          );
        }, () {}));
  }
}
