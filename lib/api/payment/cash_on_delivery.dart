import 'package:flutter/material.dart';
import 'package:goshopwooapp/api/payment/payable.dart';
import 'package:goshopwooapp/models/card_info.dart';
import 'package:goshopwooapp/models/payment_response.dart';

class CashOnDelivery implements Payable{


  @override
  Future<PaymentResponse> payForOrder({@required double amount, CardInfo card}) async {
    return PaymentResponse('cash', 'Approved');
  }
}