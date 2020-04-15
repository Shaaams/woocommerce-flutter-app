import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/models/dimension.dart';

abstract class BaseProduct implements BaseModel{


  int id, rating_count;
  String name, type,  description, short_description, sku, price,
      regular_price, sale_price, average_rating;
  bool on_sale, purchasable, reviews_allowed;
  Dimension dimensions;

  BaseProduct.fromJsonMap(Map<String, dynamic> map){
    this.id                 = map['id'];
    this.rating_count       = map['rating_count'];
    this.name               = map['name'];
    this.type               = map['type'];
    this.description        = map['description'];
    this.short_description  = map['short_description'];
    this.sku                = map['sku'];
    this.price              = map['price'];
    this.regular_price      = map['regular_price'];
    this.sale_price         = map['sale_price'];
    this.average_rating     = map['average_rating'];
    this.on_sale            = map['on_sale'];
    this.purchasable        = map['purchasable'];
    this.reviews_allowed    = map['reviews_allowed'];
    this.dimensions         = Dimension.fromJsonMap(map['dimensions']);
  }

  @override
  Map<String, dynamic> toMap() {
    return null;

  }

}