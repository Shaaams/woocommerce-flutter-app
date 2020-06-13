import 'package:flutter/material.dart';
import 'package:goshopwooapp/Routers/route_name.dart';
import 'package:goshopwooapp/Screens/home_screen.dart';
import 'package:goshopwooapp/Screens/not_found_screen.dart';
import 'package:goshopwooapp/Screens/second_screen.dart';

class CustomRoute{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
        break;
      case secondRoute:
        return MaterialPageRoute(builder: (_) => SecondScreen());
        break;
    }
    return MaterialPageRoute(builder: (_) => NotFoundScreen());
  }
}