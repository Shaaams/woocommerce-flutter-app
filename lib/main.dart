import 'package:flutter/material.dart';
import 'package:goshopwooapp/Routers/route_name.dart';
import 'package:goshopwooapp/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences shPref = await SharedPreferences.getInstance();
  bool fScreen = shPref.getBool('fScreen');
  String homeScreenRoute ;
  if (fScreen == null || !fScreen){
    homeScreenRoute = secondRoute;
  }
  runApp(MyHomePage(homeScreenRoute: homeScreenRoute));
}