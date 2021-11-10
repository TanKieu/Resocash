import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class History extends StatelessWidget {
  // const History({Key? key}) : super(key: key);

  late String _name;
  late String _money;
  late String _status;
  late String _date;
  late String _rate;

  History(@required this._name, @required this._money, @required this._status,
      @required this._date, @required this._rate);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(DateTime.parse(_date));
    Color statusColor = Colors.blue;
    if (_status == 'Canceled') statusColor = Colors.red;
    return Container(
      height: 130.0,
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
          Container(
            width: 150,
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      _name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(formatted.toString()),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    _status,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: statusColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    _money,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Row(children: [
              Text(
                _rate,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              )
            ]),
          )
          // SizedBox(
          //   width: 35.0,
          // ),
          // Column(
          //   children: [
          //     SizedBox(
          //       height: 10.0,
          //     ),
          //     Text(
          //       _date,
          //       style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          //     )
          //   ],
          // )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),

        // boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)]
      ),
    );
  }
}
