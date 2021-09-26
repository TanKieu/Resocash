import 'package:flutter/material.dart';

class History extends StatelessWidget {
  // const History({Key? key}) : super(key: key);

  late String _name;
  late String _money;
  late String _status;

  History(@required this._name, @required this._money);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.0,
          ),
          Container(
              child: Icon(
            Icons.account_box_outlined,
            size: 70.0,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                _name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
              Text(
                'Cash: ' + _money,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
              Text(
                'Success',
                style: TextStyle(fontSize: 10.0, color: Colors.blue),
              )
            ],
          ),
          SizedBox(
            width: 70.0,
          ),
          Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                '07 May',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)]
      ),
    );
  }
}
