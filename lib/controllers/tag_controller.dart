import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/controllers/controller.dart';
import 'package:goshopwooapp/models/tag.dart';

class TagController implements Controller{

  ApiInterface tagApi;

  TagController(this.tagApi);

  @override
  Future<List<dynamic>> getAll({int page}) async{
    var data = await tagApi.getAll();
    List<Tag> tags=[] ;
    for(var item in data){
      tags.add(Tag.fromJsonMap(item));
    }
    return tags;
  }


}