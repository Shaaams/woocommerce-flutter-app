import 'dart:convert';
import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:goshopwooapp/models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TagApi extends MainApi implements ApiInterface{
   Future<List<dynamic>> getAll() async{

     http.Response response =await http.get(TAGS_URL, headers: headers);
     switch (response.statusCode){
       case 401:
         throw Exception('Basic Auth has failed');
          break;
       case 200:
         return jsonDecode(response.body);
          break;
       default:
         throw Exception('A Generic error has occurred');
          break;
     }

  }

  @override
  Future gitModel(int id) async{
    throw Exception('Not implemented, as not needed');
  }

  @override
  Future updateProfile(int id, CustomerProfile profile) {
    throw Exception('not implemented, not needed');
  }
}