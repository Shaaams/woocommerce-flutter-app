import 'package:flutter/material.dart';

class OrderItem{
  int product_id, quantity, variation_id;

  OrderItem({@required this.product_id, @required this.quantity, @required this.variation_id});

  toMap(){
    Map<String, int> map = {
      "product_id"   : this.product_id,
      "quantity"     : this.quantity,
    };
    if( this.variation_id != null){
      map["variation_id"] = this.variation_id;
    }

    return map;
  }
}