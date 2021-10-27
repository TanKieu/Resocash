import 'package:flutter/material.dart';

class History extends StatelessWidget {
  // const History({Key? key}) : super(key: key);

  late String _name;
  late String _money;
  late String _status;
  late String _date;

  History(@required this._name, @required this._money, @required this._status,
      @required this._date);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                Center(
                  child: Text(
                    _name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Cash: ' + _money,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  _status,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            width: 35.0,
          ),
          Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                _date,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        // boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)]
      ),
    );
  }
}
