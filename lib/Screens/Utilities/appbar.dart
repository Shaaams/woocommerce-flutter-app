import 'package:flutter/material.dart';

AppBar mainAppBar (BuildContext context, {String title}){
  return AppBar(
    centerTitle: true,
    title:Text(title ?? ""),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}