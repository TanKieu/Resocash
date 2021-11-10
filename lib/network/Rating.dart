import 'dart:convert';

import 'package:resocash/models/Request.dart';
import 'package:resocash/request.dart';
import 'package:http/http.dart' as http;

class RatingDao {
  static const rateURL = 'http://20.188.105.155:5000/api/v1/Cashings';
  static Future<void> rateService(RequestService request, int rate) async {
    final res = await http.put(
      Uri.parse(rateURL + "/" + request.requestID),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "cashingRequestId": request.requestID,
        "amount": request.cash,
        "storeId": request.storeId,
        "casherId": request.cashierID,
        "status": request.status,
        "rating": rate
      }),
    );
    print(res.statusCode);
  }
}
