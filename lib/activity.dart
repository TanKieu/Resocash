import 'package:flutter/material.dart';
import 'package:resocash/models/Request.dart';
import 'package:resocash/network/HistoryRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './navigator.dart';
import './request.dart';
import 'main.dart';
import './history.dart';
import './account.dart';
import './inbox.dart';

class Activity extends StatefulWidget {
  Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  HistoryRequest request = new HistoryRequest();
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
                    'My Activities',
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
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                        label: Text("Notification"),
                        style: TextButton.styleFrom(
                            primary: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey),
                            )),
                      )
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
                    text: 'Activity',
                  ),
                  Tab(
                    text: 'History',
                  )
                ],
              )),
          body: TabBarView(
            children: [
              Icon(Icons.access_alarm),
              FutureBuilder<List<RequestService>>(
                future: HistoryRequest.fetchHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<RequestService>? data = snapshot.data;
                    return ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                                child: History(
                              data[index].cashierName,
                              data[index].cash.toString(),
                              data[index].status.toString(),
                              '07 may',
                            )),
                          );
                        });
                  } else {
                    return Text('No History');
                  }
                },
              )
              // ListView(children: [
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     child: Container(
              //       child: History("Nguyen Van A", '50.000.000'),
              //     ),
              //   ),
              // ]),
            ],
          ),
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
              () {},
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inbox()),
                );
              },
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
              })),
    );
  }
}
