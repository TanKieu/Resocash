import 'package:flutter/material.dart';
import './request.dart';
import './activity.dart';
import 'main.dart';

class Navigate extends StatelessWidget {
  // const Navigate({Key? key}) : super(key: key);

  VoidCallback _requestNav;
  VoidCallback _activityNav;
  VoidCallback _inboxNav;
  VoidCallback _accountNav;

  Navigate(@required this._requestNav, @required this._activityNav,
      @required this._inboxNav, @required this._accountNav);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                  onPressed: _requestNav,
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
                  onPressed: _activityNav,
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
                  onPressed: _inboxNav,
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
                    onPressed: _accountNav,
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
    );
  }
}
