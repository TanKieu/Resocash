import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:resocash/request_matched.dart';
import 'package:resocash/transfer.dart';
import 'package:resocash/transfer_complete.dart';

import 'firebase_db/request_dao.dart';
import 'models/Request.dart';
// import 'package:resocash/request_matched.dart';

class RequestProcess extends StatefulWidget {
  final String cash;
  final String dbtoken;
  const RequestProcess({Key? key, required this.cash, required this.dbtoken})
      : super(key: key);

  @override
  _RequestProcessState createState() => _RequestProcessState();
}

class _RequestProcessState extends State<RequestProcess> {
  final _scollController = ScrollController();
  Widget _getRequest() {
    final requestDao = RequestDao();
    return Container(
      height: 250,
      child: FirebaseAnimatedList(
        controller: _scollController,
        query: requestDao.getRequestQuery(widget.dbtoken),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final request = RequestService.fromJson(json);
          if (request.status == 'accepted') {
            return RequestMatched(
              request: request,
              dbKey: widget.dbtoken,
            );
          }
          if (request.status == 'transfered') {
            return Complete();
          }
          if (request.status == 'arrived') {
            return Transfer(request: request);
          }

          return Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_walk,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Looking for a cashier ...',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 30,
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancle"),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey),
                        )),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getRequest();
  }
}
