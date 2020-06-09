import 'package:flutter/material.dart';
import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/models/address.dart';

class CustomerProfile implements BaseModel{

  String first_name, last_name, avatar_url;
  Address billing, shipping;


  CustomerProfile({
    this.first_name,
    this.last_name,
    this.avatar_url,
    this.billing,
    this.shipping});

  toMap() {
    Map<String, dynamic> map = {};
    if (this.first_name != null) {
      map['first_name'] = this.first_name;
    }
    if (this.last_name != null) {
      map['last_name'] = this.last_name;
    }
    if (this.avatar_url != null) {
      map['avatar_url'] = this.avatar_url;
    }
    if (this.billing != null) {
      map['billing'] = this.billing.toMap();
    }
    if (this.shipping != null) {
      map['shipping'] = this.shipping.toMap();
    }
    return map;
  }

}