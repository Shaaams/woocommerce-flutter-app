
import 'package:goshopwooapp/models/product.dart';

class VariableProduct extends Product{
    List<int> variations ;

  VariableProduct.fromJsonMap(Map<String, dynamic> map) : super.fromJsonMap(map){
    this.variations =[];
   // throw Exception(map['variations']);
    if(map[variations] != null){
      for(var item in map['variations']){
        this.variations.add(item);
      }
    }

  }
}