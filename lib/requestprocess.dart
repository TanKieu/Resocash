import 'package:flutter/material.dart';
import 'package:resocash/modabottom.dart';
import 'package:resocash/models/Request.dart';

class OnProcess extends StatefulWidget {
  final RequestService request;
  const OnProcess({Key? key, required this.request}) : super(key: key);

  @override
  _OnProcessState createState() => _OnProcessState();
}

class _OnProcessState extends State<OnProcess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                    context: context,
                    builder: (context) => RequestProcess(
                        cash: widget.request.cash.toString(),
                        dbtoken: widget.request.requestID));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25.0,
                    ),
                    Container(
                        child: Icon(
                      Icons.account_circle,
                      size: 90.0,
                      color: Colors.blueGrey,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.request.cashierName,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Cash: ' + widget.request.cash.toString(),
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'On Going',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 10.0,
                    //     ),
                    //     Text(
                    //       widget.request.,
                    //       style: TextStyle(
                    //           fontSize: 15.0, fontWeight: FontWeight.w400),
                    //     )
                    //   ],
                    //)
                  ],
                ),
              ),
            )),
      ]),
      decoration: BoxDecoration(
        color: Color(0xffFDE8E8),
        borderRadius: BorderRadius.circular(10),

        // boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)]
      ),
    );
  }
}
