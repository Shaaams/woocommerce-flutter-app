import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goshopwooapp/api/payment/payable.dart';
import 'package:goshopwooapp/models/card_info.dart';
import 'package:goshopwooapp/models/payment_response.dart';
import 'package:http/http.dart' as http;

class CheckoutPayment implements Payable{

  static String publicKey = "pk_test_6ca82a28-ab1a-4099-b674-514693abfbde";
  static String secretKey = "sk_test_deba4504-6098-4063-a204-6d2aae6ec080";

  String tokenUrl = "https://api.sandbox.checkout.com/tokens";
  String paymentUrl = "https://api.sandbox.checkout.com/payments";

  Map<String,String> tokenHeaders = {
    'Content-Type' : 'application/json',
    'Authorization' : publicKey,
  };

  Map<String, String> paymentHeaders = {
    'Content-Type' : 'application/json',
    'Authorization' : secretKey,
  };

  Future<String> _getToken({@required CardInfo card}) async {
    Map<String, String> body = {
      "type"         : "card",
      "number"       : card.number, //"4543474002249996",
      "expiry_month" : card.month,  //"12",
      "expiry_year"  : card.year,  //"2025",
    };
    http.Response response = await http.post(tokenUrl , headers: tokenHeaders , body: jsonEncode(body));
//    print(response.statusCode);
//    print(response.body);
    switch( response.statusCode ){
      case 201:
        var body = jsonDecode(response.body);
        return body['token'];
        break;
      default:
        throw Exception('Error');
        break;
    }

  }

  @override
  Future<PaymentResponse> payForOrder({@required double amount, CardInfo card}) async{
    String token = await this._getToken(card: card);
    Map<String, dynamic> body = {
      "source" : {
        "type" : "token",
        "token": token,
      },
      "amount" : amount,
      "currency" : "usd"
    };

    http.Response response = await http.post(paymentUrl, headers: paymentHeaders, body: jsonEncode(body));
    switch(response.statusCode ){
      case 201:
        var body = jsonDecode(response.body);
        return PaymentResponse( body['id'] , body['response_summary']);
        break;
      default:
        throw Exception('Payment failed');
        break;
    }
  }
}