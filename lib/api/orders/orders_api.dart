import 'dart:convert';

import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:goshopwooapp/models/order.dart';
import 'package:goshopwooapp/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi extends MainApi implements ApiInterface{
  @override
  Future<List> getAll({int page}) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    int userId = sharedPreferences.getInt('user_id');
    int userId = 1;
    print(ORDERS_URL + '?customer=${userId.toString()}');
    http.Response response = await http.get(ORDERS_URL + '?customer=${userId.toString()}', headers: headers);
    print(response.statusCode);
   // print(response.body);
      switch( response.statusCode ){
        case 401:
          throw Exception('Basic Auth has failed');
          break;
        case 200:
          return jsonDecode(response.body);
          break;
        default:
          throw Exception('No data received');
          break;
      }
  }

  @override
  Future gitModel(int id) async {
    http.Response response = await http.get(ORDERS_URL + '/${id.toString()}', headers: headers);
    switch( response.statusCode ){
      case 401:
        throw Exception('Basic Auth has failed');
        break;
      case 200:
        return jsonDecode(response.body);
        break;
      default:
        throw Exception('No data received');
        break;
    }
  }

  @override
  Future getVariations(int product) {
    throw Exception('not implemented, not needed');
  }

  @override
  Future updateProfile(int pa, CustomerProfile profile) {
    throw Exception('not implemented, not needed');
  }

}