import 'dart:convert';

abstract class MainApi {
  static String username = 'ck_b9f4844be409cbf0f8a0fd7b72a7bc029924ed26';
  static String password = 'cs_505a7d8047b5c44aeed6222f84f05296bdb817a6';

  Map<String, String> headers ={
    'accept'  : 'application/json',
    //'content-type': 'application/json',
    'authorization' : 'Basic ' + base64Encode(utf8.encode('$username:$password')),
  };
  static String MAIN_URL = 'https://goshopwooapp.000webhostapp.com/wp-json/';
  static String AUTH_URL = MAIN_URL + 'wooapp/v1/auth/';
  String LOGIN_URL = AUTH_URL + 'login';
  String REGISTER_URL = AUTH_URL + 'register';
  static String API_URL = MAIN_URL + 'wc/v3/';
  String TAGS_URL       = API_URL + 'products/tags';
  String CATEGORIES_URL = API_URL + 'products/categories';

}