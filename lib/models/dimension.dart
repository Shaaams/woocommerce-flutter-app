import 'package:goshopwooapp/contracts/base_model.dart';

class Dimension implements BaseModel{
  String length, width, height;

  Dimension.fromJsonMap(Map<String, dynamic> map){
    this.length = map['length'];
    this.width  = map['width'];
    this.height = map['height'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'length' : this.length,
      'width'  : this.width,
      'height' : this.height,
    };
  }


}