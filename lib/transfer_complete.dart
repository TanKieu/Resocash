import 'package:flutter/material.dart';
import 'package:resocash/firebase_db/request_dao.dart';
import 'package:resocash/models/Request.dart';
import 'package:resocash/rating.dart';

import 'modabottom.dart';

class Complete extends StatefulWidget {
  final RequestService request;
  final String dbKey;
  const Complete({Key? key, required this.dbKey, required this.request})
      : super(key: key);

  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Transfering is complete',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Please pay down for cashier and finish request.',
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                RequestDao request = new RequestDao();
                request.finishRequest(widget.dbKey);
                Navigator.pop(context);
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Rating(
                          request: widget.request,
                        ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.greenAccent,
                ),
                alignment: Alignment.center,
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Finish Request',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
