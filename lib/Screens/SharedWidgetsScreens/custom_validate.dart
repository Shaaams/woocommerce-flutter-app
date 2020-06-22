import 'package:flutter/material.dart';
//Validate Of Email
String emailValidate(String value){

  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if(value.isEmpty)
  {
    return 'Email Is Required';
  }else if(!regex.hasMatch(value)){
    return 'Enter Valid Email';
  }
  return null;
}

//Validate Of Name
String nameValidate(String value) {

  String pattern = r'^[a-z A-Z,.\-]+$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0 || value.isEmpty) {
    return 'Name Is Required';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid name';
  }
  return null;
}

//Validate Of Password
String passwordValidate(String value){

  Pattern pattern = r'^(?:(?=.[a-z])(?:(?=.[A-Z])(?=.[\d\W])|(?=.\W)(?=.\d))|(?=.\W)(?=.[A-Z])(?=.\d)).{8,32}$';
  RegExp regex = new RegExp(pattern);

  if (value.length < 8 || value.isEmpty) {
    return 'Password Is Required';
  }else if (!regex.hasMatch(value)) {
    return 'Please enter valid password';
  }
  return null;
}

String confirmPasswordValidate(String value, TextEditingController mainTextEditingController, TextEditingController subTextEditingController) {
  if (mainTextEditingController.text.isNotEmpty &&
      subTextEditingController.text.isNotEmpty) {
            if (mainTextEditingController.text != subTextEditingController.text) {
              return 'Your password do not match';
            }
          }
          return null;
}