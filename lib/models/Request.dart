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

  RequestService(this.requestID, this.storeId, this.storeAddress, this.cash,
      this.status, this.cashierID, this.cashierName, this.areaId);

  RequestService.fromJson(Map<dynamic, dynamic> json)
      : requestID = json['cashingRequestID'],
        storeId = json['storeId' as String],
        storeAddress = json['storeAddress'],
        cash = json['amount'],
        status = json['status'],
        cashierID = json['cashierID'],
        cashierName = json['cashierName'],
        areaId = json['areaId'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'cashingRequestID': requestID,
        'amount': cash,
        'storeID': storeId,
        'cashierId': cashierID,
        'cashierName': cashierName,
        'areaID': areaId,
        'status': status,
        'storeAddress': storeAddress
      };
}
