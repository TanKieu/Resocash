import 'package:flutter/material.dart';
import './request.dart';
import './activity.dart';
import './inbox.dart';
import './account.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;
  LatLng _center = new LatLng(13.057996, 109.319491);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          children: [
            Text(
              'Hello, Store',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.redAccent,
                ),
                Text(
                  'Store address: Tuy Hoa, Phu Yen',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ],
            )
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
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 70.0,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(left: 5.0),
                    icon: Icon(Icons.notifications_active_sharp),
                    color: Colors.lightBlue,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Request',
                    style: TextStyle(),
                  ),
                ),
              ]),
            ),
            Container(
              height: 70.0,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.receipt_long_outlined),
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Activity()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: Text(
                    'Activity',
                    style: TextStyle(),
                  ),
                ),
              ]),
            ),
            SizedBox(
              width: 5.0,
            ),
            Container(
              height: 70.0,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.chat_outlined),
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Inbox()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    'Inbox',
                    style: TextStyle(),
                  ),
                ),
              ]),
            ),
            Container(
              height: 70.0,
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(0.0),
                    child: IconButton(
                      iconSize: 35.0,
                      padding: EdgeInsets.only(right: 5.0),
                      icon: Icon(Icons.account_circle),
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Account()),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    'Account',
                    style: TextStyle(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
