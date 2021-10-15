import 'Cashier.dart';

class RequestService {
  final String storeId;
  final String storeAddress;
  final String cash;
  final String status;
  final Cashier cashier;

  RequestService(
      this.storeId, this.storeAddress, this.cash, this.status, this.cashier);

  RequestService.fromJson(Map<dynamic, dynamic> json)
      : storeId = json['storeId' as String],
        storeAddress = json['storeAddress'],
        cash = json['cash'],
        status = json['status'],
        cashier = Cashier.fromJson(json['cashier']);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'storeId': storeId,
        'storeAddress': storeAddress,
        'cash': cash,
        'status': status,
        'cashier': cashier.toJson(),
      };
}
