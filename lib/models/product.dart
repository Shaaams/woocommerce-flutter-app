import 'package:goshopwooapp/models/base_product.dart';
import 'package:goshopwooapp/models/category.dart';
import 'package:goshopwooapp/models/image.dart';


class Product extends BaseProduct{
  List<int> related_ids;
  List<Category> categories ;
  List<Image> images;

  Product.fromJsonMap(Map<String, dynamic> map) : super.fromJsonMap(map){
    // fetch List related ids from api
    this.related_ids = [];
    if(map['related_ids'] != null){
      for(var item in related_ids){
        related_ids.add(item);
      }
    }

    // fetch List Categories from api
    this.categories = [];
    if(map['categories'] != null){
      for (var item in map['categories']){
        categories.add(Category.fromJsonMap(item));
      }
    }

    // fetch List images ids from api
    this.images = [];
    if(map['images'] != null){
      for(var item in map['images']){
        images.add(Image.fromJsonMap(item));
      }
    }


  }

}