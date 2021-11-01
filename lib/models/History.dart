import 'dart:ffi';

import 'package:resocash/history.dart';

import 'Cashier.dart';

class HistoryOBJ {
  String requestID;
  final String storeId;
  final String storeAddress;
  final String areaId;
  final int cash;
  String status;
  //final Cashier cashier;
  final String cashierID;
  final String cashierName;
  final String date;

  HistoryOBJ(this.requestID, this.storeId, this.storeAddress, this.cash,
      this.status, this.cashierID, this.cashierName, this.areaId, this.date);

  HistoryOBJ.fromJson(Map<dynamic, dynamic> json)
      : requestID = json['id'],
        storeId = json['storeId' as String],
        storeAddress = json['storeAddress'],
        cash = json['amount'],
        status = json['status'],
        cashierID = json['cashierId'],
        cashierName = json['cashierName'],
        areaId = json['areaId'],
        date = json['localDateTime'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'cashingRequestID': requestID,
        'amount': cash,
        'storeId': storeId,
        'cashierID': cashierID,
        'cashierName': cashierName,
        'areaId': areaId,
        'status': status
      };
}
