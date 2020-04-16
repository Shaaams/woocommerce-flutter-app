import 'package:goshopwooapp/api/main_api.dart';
import 'package:goshopwooapp/models/tag.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TagApi extends MainApi{
   Future<List<Tag>> getTag() async{
     List<Tag> tags = [];

     http.Response response =await http.get(TAGS_URL, headers: headers);
     print(response.statusCode);
     print(response.body);
     return tags;

  }
}