import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resocash/firebase_db/request_dao.dart';
import 'package:resocash/modabottom.dart';
import 'package:resocash/models/Request.dart';
import 'package:resocash/request.dart';
import 'package:resocash/transfer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestMatched extends StatefulWidget {
  final RequestService request;
  final String dbKey;

  const RequestMatched({Key? key, required this.request, required this.dbKey})
      : super(key: key);

  @override
  _RequestMatchedState createState() => _RequestMatchedState();
}

class _RequestMatchedState extends State<RequestMatched> {
  final requestDao = RequestDao();

  void _updateStatus() {
    widget.request.status = 'arrived';
    print('sjdfbjdfnasdf   ' + widget.dbKey);
    requestDao.updateRequest(widget.request, widget.dbKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(children: [
          SizedBox(
            height: 18,
          ),
          Text(
            'Cashier is driving to store ...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13, right: 20),
                    child: Text(
                      'Cash: ',
                      style: TextStyle(fontSize: 15, color: Colors.redAccent),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Flexible(
                        child: Row(children: [
                          Icon(Icons.monetization_on),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.request.cash.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, top: 13),
                    child: Text(
                      'Address: ',
                      style: TextStyle(fontSize: 15, color: Colors.redAccent),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flexible(
                        child: Text(
                          widget.request.storeAddress,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, bottom: 0),
                    child: Icon(
                      Icons.person_sharp,
                      size: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28, bottom: 10),
                    child: Text(
                      widget.request.cashierName.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 10),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message_sharp,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: TextButton(
                      onPressed: _updateStatus,
                      child: Text(
                        'Cashier Arrived',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
