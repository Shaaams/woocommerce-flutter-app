import 'package:goshopwooapp/api/auth/auth_interface.dart';
import 'package:goshopwooapp/api/main_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApi extends MainApi implements AuthInterface{
  @override
  Future<dynamic> login(Map<String, dynamic > data) async {
    http.Response response = await http.post( LOGIN_URL , headers: headers , body: data );
    switch( response.statusCode ){
      case 403:
        throw Exception( 'Wrong credentials' );
        break;
      case 500 :
        throw Exception('an error occurred');
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
  Future<dynamic> register(Map<String, dynamic > data) async {
    print(data);
    http.Response response = await http.post( REGISTER_URL , headers: headers , body: data );
    switch( response.statusCode ){
      case 403:
        throw Exception( 'Wrong credentials' );
        break;
      case 500 :
        throw Exception('an error occurred');
        break;
      case 502 :
        throw Exception('user already exists in the system!');
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

}