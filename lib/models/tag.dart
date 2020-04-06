import 'package:goshopwooapp/contracts/base_model.dart';
//Implementation of the Interface
class Tag implements BaseModel {
  // All Properties
  int id, count;
  String name, description;

  // Named Constructor to receive All Properties from Api
  Tag.fromJsonMap(Map<String, dynamic> map){
    if(map['id'] == null){
      throw Exception('Tag ID is not set yet');
    }
    this.id = map['id'];
    this.count = map['count'];
    if(map['name'] == null){
      throw Exception('Tag Nmae for ID= ${this.id} is not set yet');
    }
    this.name = map['name'];
    this.description = map['description'];
  }

  // Convert Method From jsonObject To Map
  @override
  Map<String, dynamic> toMap() {
    return {
      'id'           : this.id,
      'count'        : this.count,
      'name'         : this.name,
      'description'  : this.description,
    };
  }

}