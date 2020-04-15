import 'package:goshopwooapp/models/base_product.dart';

class VariableProduct extends BaseProduct{
    List<int> variations ;

  VariableProduct.fromJsonMap(Map<String, dynamic> map) : super.fromJsonMap(map){
    this.variations =[];
    if(map[variations] != null){
      for(var item in map['variations']){
        this.variations.add(item);
      }
    }
  }
}