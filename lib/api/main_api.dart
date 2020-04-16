import 'dart:convert';

abstract class MainApi {
  static String username = 'ck_b9f4844be409cbf0f8a0fd7b72a7bc029924ed26';
  static String password = 'cs_505a7d8047b5c44aeed6222f84f05296bdb817a6';
  // static String basicAuth ='Basic ' + base64Encode(utf8.encode('$username:$password'));

  Map<String, String> headers ={
     'accept'  : 'application/json',
      'authorization' : 'Basic ' + base64Encode(utf8.encode('$username:$password')),
//    'authorization' : basicAuth,
//    'content-type': 'application/json',
//    'accept': 'application/json',
//    'authorization': basicAuth,
  };

  static String API_URL = 'http://goshopwooapp.herokuapp.com/wp-json/wc/v3/';
  String TAGS_URL       = API_URL + 'products/tags';
  String CATEGORIES_URL = API_URL + 'products/categories';

}