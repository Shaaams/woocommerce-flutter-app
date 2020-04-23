class PropertyIsRequired implements Exception{
 String nameClass;
String property;


 PropertyIsRequired(this.nameClass, this.property);

 @override
  String toString() {
    return 'Property For ${this.nameClass} = ${this.property} has not been set';
  }
}

class ModelApiEx implements Exception{
 String msg;


 ModelApiEx(this.msg);

 @override
 String toString() {
   return '';
 }


}