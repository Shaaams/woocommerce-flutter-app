import 'package:flutter/material.dart';
import 'package:goshopwooapp/Routers/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void goHome (BuildContext context){
  Navigator.of(context).pushNamed(homePageScreenRoute);
}

void logOut(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove('user_id');
  sharedPreferences.remove('seen');
  Navigator.of(context).pushNamed(welcomeRoute);

}