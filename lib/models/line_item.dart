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