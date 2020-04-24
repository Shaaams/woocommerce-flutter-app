import 'dart:convert';
import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:http/http.dart' as http;

class CategoryApi extends MainApi implements ApiInterface{
  @override
  Future<List<dynamic>> getAll() async{
    http.Response response = await http.get(CATEGORIES_URL, headers: headers);
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
  Future<dynamic> gitModel(int id) async{
    throw Exception('not implemented , as not needed');
  }

}