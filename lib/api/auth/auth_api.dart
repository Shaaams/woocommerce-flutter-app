import 'package:goshopwooapp/api/auth/auth_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApi extends MainApi implements AuthInterface{
  @override
    Future<dynamic> login(Map<String, dynamic > data) async {
      http.Response response = await http.post( LOGIN_URL , headers: headers , body: data );
      print(response.statusCode);
      print(response.body);
      switch( response.statusCode ){
        case 403:
          throw Exception( 'Wrong credentials' );
          break;
        case 500 :
          throw Exception('an error accurred');
          break;
        case 404:
          throw Exception('Resource not found');
          break;
        case 200:
          return jsonDecode(response.body);
          break;
      }
    return null;
  }

  @override
  Future<dynamic> register(Map<String, dynamic> data) async{
    // TODO: implement register
    return null;
  }

}