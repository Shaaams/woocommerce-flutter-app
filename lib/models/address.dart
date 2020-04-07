import 'package:goshopwooapp/contracts/base_model.dart';
//Implementation of the Interface
class Address implements BaseModel{
  // All Properties

  String type, first_name, last_name, company, address_1, address_2;
  String city, state, postcode, country, email, phone ;

  // Named Constructor to receive All Properties from Api
  Address.fromJsonMap(Map<String, dynamic> map, String type){
    this.type       = type;
    this.first_name = map['first_name'];
    this.last_name  = map['last_name'];
    this.company    = map['company'];
    this.address_1  = map['address_1'];
    this.address_2  = map['address_2'];
    this.city       = map['city'];
    this.state      = map['state'];
    this.postcode   = map['postcode'];
    this.country    = map['country'];
    this.email      = map['email'];
    this.phone      = map['phone'];
  }
  // Convert Method From jsonObject To Map
  @override
  Map<String, dynamic> toMap() {
    return {
      this.type  :{
        'first_name'   : this.first_name,
        'last_name'    : this.last_name,
        'company'      : this.company,
        'address_1'    : this.address_1,
        'address_2'    : this.address_2,
        'city'         : this.city,
        'state'        : this.state,
        'postcode'     : this.postcode,
        'country'      : this.country,
        'email'        : this.email,
        'phone'        : this.phone,
      }
    };
  }


}