import 'package:flutter/material.dart';
import 'package:goshopwooapp/models/card_info.dart';
import 'package:goshopwooapp/models/payment_response.dart';

class Payable{

  Future<PaymentResponse> payForOrder({@required double amount, CardInfo card}) async{}
}