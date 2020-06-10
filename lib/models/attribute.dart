import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/exceptions/exceptions.dart';
//Implementation of the Interface
class Attribute implements BaseModel{
  // All Properties
  int id;
  String name;
  String option;

  // Named Constructor to receive All Properties from Api
  Attribute.fromJsonMap(Map<String, dynamic> map){
    if(map['id'] == null){
      throw PropertyIsRequired('Attribute',map['id']);
    }
      this.id   = map['id'];
    if(map['name'] == null){
      throw PropertyIsRequired( 'Attribute', map['name']);
    }
      this.name = map['name'];

    if(map['option'] == null){
      throw PropertyIsRequired( 'Attribute', map['option']);
    }
    this.option = map['option'];
  }

  // Convert Method From jsonObject To Map
  @override
  Map<String,dynamic > toMap() {
    return {
      'id'     : this.id,
      'name'   : this.name,
      'option' : this.option,

    };
  }

}