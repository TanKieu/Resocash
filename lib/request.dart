// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late GoogleMapController mapController;

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    LatLng _center = new LatLng(13.057996, 109.319491);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Request',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _visible = true;
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextField(
                  onTap: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                      ),
                    ),
                    hintText: 'Cash',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextField(
                  onTap: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                      ),
                    ),
                    hintText: 'Location',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
              Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 10.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Create Request"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey),
                      )),
                ),
              )
              // GoogleMap(
              //   onMapCreated: _onMapCreated,
              //   initialCameraPosition: CameraPosition(
              //     target: _center,
              //     zoom: 30.0,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      floatingActionButton: Visibility(
        visible: _visible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Cancel Request',
          child: const Icon(Icons.cancel),
          backgroundColor: Colors.redAccent,
        ),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                      onPressed: () {},
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
