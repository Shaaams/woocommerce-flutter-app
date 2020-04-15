class Image{
  int id;
  String src, name;

  Image.fromJsonMap(Map<String, dynamic> map){
    this.id    = map['id'];
    this.src   = map['src'];
    this.name  = map['name'];
  }
}