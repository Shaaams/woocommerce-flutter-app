import 'dart:convert';

import 'package:goshopwooapp/api/main_api.dart';
import 'package:goshopwooapp/models/tag.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TagApi extends MainApi{
   Future<List<Tag>> getTag() async{
     List<Tag> tags = [];

     http.Response response =await http.get(TAGS_URL, headers: headers);
     switch (response.statusCode){
       case 401:
         throw Exception('Basic Auth has failed');
          break;
       case 200:
         var body = jsonDecode(response.body);
         for(var item in body){
           tags.add(Tag.fromJsonMap(item));
         }
          break;
       default:
         throw Exception('A Generic error has occurred');
          break;
     }
     return tags;

  }
}