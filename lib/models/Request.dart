import 'dart:ffi';

import 'Cashier.dart';

class RequestService {
  String requestID;
  final String storeId;
  final String storeAddress;
  final String areaId;
  final int cash;
  String status;
  //final Cashier cashier;
  final String cashierID;
  final String cashierName;
  final String position;

  RequestService(
      this.requestID,
      this.storeId,
      this.storeAddress,
      this.cash,
      this.status,
      this.cashierID,
      this.cashierName,
      this.areaId,
      this.position);

  RequestService.fromJson(Map<dynamic, dynamic> json)
      : requestID = json['cashingRequestId'],
        storeId = json['storeId' as String],
        storeAddress = json['storeAddress'],
        cash = json['amount'],
        status = json['status'],
        cashierID = json['cashierId'],
        cashierName = json['cashierName'],
        areaId = json['areaId'],
        position = json['storePosition'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'cashingRequestId': requestID,
        'amount': cash,
        'storeId': storeId,
        'cashierId': cashierID,
        'cashierName': cashierName,
        'areaId': areaId,
        'status': status,
        'storeAddress': storeAddress,
        'storePosition': position
      };
}
