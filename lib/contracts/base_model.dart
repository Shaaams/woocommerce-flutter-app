//General Interface preparation to standardize Methods
class BaseModel {

  // Named Constructor to receive All Properties from Api
  BaseModel.fromJsonMap(Map<String,dynamic> jsonMap){}

  // Convert Method From jsonObject To Map
  Map<String, dynamic> toMap(){}
}