import 'package:goshopwooapp/models/address.dart';
class LineItem{
  int id, product_id, quantity, variation_id;
  String name, subtotal, subtotal_tax, total, total_tax, sky;

  LineItem.fromJson(Map<String, dynamic> map){
    this.id           = map['id'];
    this.product_id   = map['product_id'];
    this.quantity     = map['quantity'];
    this.variation_id = map['variation_id'];
    this.name         = map['name'];
    this.subtotal     = map['subtotal'];
    this.subtotal_tax = map['subtotal_tax'];
    this.total        = map['total'];
    this.total_tax    = map['total_tax'];
    this.sky          = map['sky'];
  }
}
class Order {
  int id, customer_id;
  String number, order_key, status, date_created, date_modified,
      discount_total, shipping_total, cart_tax, total, total_tax,
      payment_method, payment_method_title, transaction_id ;
  Address billing, shipping;
  List<LineItem> line_items;

  Order.fromJson(Map<String, dynamic> map){
    this.id                   = map['id'];
    this.customer_id          = map['customer_id'];
    this.number               = map['number'];
    this.order_key            = map['order_key'];
    this.status               = map['status'];
    this.date_created         = map['date_created'];
    this.date_modified        = map['date_modified'];
    this.discount_total       = map['discount_total'];
    this.shipping_total       = map['shipping_total'];
    this.cart_tax             = map['cart_tax'];
    this.total                = map['total'];
    this.total_tax            = map['total_tax'];
    this.payment_method       = map['payment_method'];
    this.payment_method_title = map['payment_method_title'];
    this.transaction_id       = map['transaction_id'];
    this.billing              = Address.fromJsonMap(map['billing']);
    this.shipping             = Address.fromJsonMap(map['shipping']);
    this.line_items =[];
    for(var item in map['line_items']){
      line_items.add(LineItem.fromJson(item));
    }
  }

}