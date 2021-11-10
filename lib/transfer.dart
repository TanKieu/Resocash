import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resocash/models/Request.dart';
import 'package:resocash/transfer_complete.dart';
import 'package:intl/intl.dart';

class Transfer extends StatefulWidget {
  final RequestService request;
  const Transfer({Key? key, required this.request}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

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
            'Cashier is transfering ...',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            width: 232,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Flexible(
                child: Row(children: [
                  Icon(Icons.monetization_on),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _formatNumber(widget.request.cash
                            .toString()
                            .replaceAll(',', '')) +
                        ' vnd',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
