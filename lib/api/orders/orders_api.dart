import 'dart:convert';
import 'package:goshopwooapp/api/profile/profile_api.dart';
import 'package:goshopwooapp/controllers/profile_controller.dart';
import 'package:goshopwooapp/models/address.dart';
import 'package:goshopwooapp/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:goshopwooapp/models/order_item.dart';
import 'package:goshopwooapp/models/profile.dart';
import 'package:http/http.dart' as http;

class OrderApi extends MainApi implements ApiInterface{

  Future<bool> createOrder(List<OrderItem> items, {Address billing, Address shipping}) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String customer_id = sharedPreferences.getString("user_id");
    ProfileController profileController = ProfileController(ProfileApi());
    Customer customer = await profileController.getCustomer(1);
    List<Map<String,int>> itemsMap = [];
    for( OrderItem item in items ){
      itemsMap.add(item.toMap());
    }
    Map<String,dynamic> body = {
      'customer_id' : 1,
      'line_items' : itemsMap,
      'set_paid' : true
    };
    if (billing != null ){
      body["billing"] = billing;
    }else{
      body["billing"] = customer.billing.toMap();
    }
    if ( shipping != null){
      body["shipping"] = shipping;
    }else{
      body["shipping"] = customer.shipping.toMap();
    }
    http.Response response = await http.post(ORDERS_URL, headers: headers, body: jsonEncode(body));
    print(response.statusCode);
    print(response.body);
      switch( response.statusCode ){
        case 201:
          return true;
          break;
        default:
          throw Exception('Order not created');
          break;
      }
  }
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