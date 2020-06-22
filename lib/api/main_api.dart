import 'dart:convert';

abstract class MainApi {
  // static String username = 'ck_b9f4844be409cbf0f8a0fd7b72a7bc029924ed26';
  static String username = 'ck_4cf4a1e8dcc05fb6d978f03673aec332d42c5cb4';
 // static String password = 'cs_505a7d8047b5c44aeed6222f84f05296bdb817a6';
  static String password = 'cs_a0e6b77d8d2dc143ae0d4fb4958360d5b0558363';

  Map<String, String> headers ={
    'Accept' : 'application/json',
    'Content-Type' : 'application/json',
    'authorization' : 'Basic ' + base64Encode(utf8.encode('$username:$password')),

  };

  // https://woocommerce-169250-1222153.cloudwaysapps.com/wp-json/wooapp/v1/auth/login
  static String   SHAMSS_URL = 'https://goshopwooapp.000webhostapp.com/wp-json/';
  static String MAIN_URL = 'https://woocommerce-169250-1222153.cloudwaysapps.com/wp-json/';
  static String API_URL = MAIN_URL + 'wc/v3/';
  static String AUTH_URL = MAIN_URL + 'wooapp/v1/auth/';
  String LOGIN_URL = AUTH_URL + 'login';
  String REGISTER_URL = AUTH_URL + 'register';
  String TAGS_URL       = API_URL + 'products/tags';
  String CATEGORIES_URL = API_URL + 'products/categories';
  String PROFILE_URL = API_URL + 'customers/';
  String PRODUCTS_URL = API_URL + 'products';
  String ORDERS_URL = API_URL + 'orders';

}