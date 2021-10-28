import 'Cashier.dart';

class RequestService {
  final String storeId;
  final String storeAddress;
  final String areaId;
  final String cash;
  String status;
  final String cashierID;
  final String cashierName;

  RequestService(this.storeId, this.storeAddress, this.cash, this.status,
      this.cashierID, this.cashierName, this.areaId);

  RequestService.fromJson(Map<dynamic, dynamic> json)
      : storeId = json['storeId' as String],
        storeAddress = json['storeAddress'],
        cash = json['cash'],
        status = json['status'],
        //cashier = Cashier.fromJson(json['cashier']),
        cashierID = json['cashierID'],
        cashierName = json['cashierName'],
        areaId = json['areaId'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'storeId': storeId,
        'storeAddress': storeAddress,
        'cash': cash,
        'status': status,
        'cashierID': cashierID,
        'cashierName': cashierName,
        'areaId': areaId,
      };
}
