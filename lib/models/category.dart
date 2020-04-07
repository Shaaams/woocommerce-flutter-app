import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/exceptions/exceptions.dart';
//Implementation of the Interface
class Category implements BaseModel{
  // All Properties
  int id, parent, count;
  String name, description;
  String image;
  // Named Constructor to receive All Properties from Api
  Category.fromJsonMap(Map<String,dynamic> map){
    if(map['id'] == null){
      throw PropertyIsRequired('id');
    }
      this.id            = map['id'];
      this.parent        = map['parent'];
      this.count         = map['count'];
    if(map['name'] == null){
      throw PropertyIsRequired('name');
    }
      this.name          = map['name'];
      this.description   = map['description'];
      this.image         = map['image']['src'];
  }
  // Convert Method From jsonObject To Map
  @override
  Map<String, dynamic> toMap() {
    return {
      'id'          : this.id,
      'parent'      : this.parent,
      'count'       : this.count,
      'name'        : this.name,
      'description' : this.description,
      //'image'       : this.image,
      'image'       : {
        'src' : this.image,
      }
    };
  }

}