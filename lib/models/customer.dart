import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/exceptions/exceptions.dart';
import 'package:goshopwooapp/models/address.dart';
//Implementation of the Interface
class Customer implements BaseModel{
  // All Properties
  int id;
  String email, first_name, last_name, avatar_url, username;
  Address shipping, billing;

  // Named Constructor to receive All Properties from Api
  Customer.fromJsonMap(Map<String, dynamic> map){
    if(map['id'] == null){
      throw PropertyIsRequired( 'Customer', map['id']);
    }
    this.id         = map['id'];
    this.username   = map['username'];
    this.email      = map['email'];
    this.first_name = map['fist_name'];
    this.last_name  = map['last_name'];
    this.avatar_url = map['avatar_url'];
    this.shipping   = Address.fromJsonMap(map['shipping']);
    this.billing    = Address.fromJsonMap(map['billing']);
  }
  // Convert Method From jsonObject To Map
  @override
  Map<String, dynamic> toMap() {
    return {
      'id'         : this.id,
      'username'   : this.username,
      'email'      : this.email,
      'first_name' : this.first_name,
      'last_name'  : this.last_name,
      'avatar_url' : this.avatar_url,
      'shipping'   : this.shipping.toMap(),
      'billing'    : this.billing.toMap(),
    };
  }

}