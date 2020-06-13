import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/custom_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key){
  return CustomLocalization.of(context).translateValue(key);
}

//language constants

const String ENGLISH = 'en';
const String ARABIC  = 'ar';

//language constant

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode ) async {
  SharedPreferences shPref = await SharedPreferences.getInstance();
  await shPref.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale ( String languageCode){
  Locale _temp;
  switch(languageCode){
    case ENGLISH:
      _temp = Locale(languageCode , 'US');
      break;
    case ARABIC:
      _temp = Locale(languageCode , 'EG');
      break;
    default:
      _temp = Locale(languageCode , 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences shPref = await SharedPreferences.getInstance();
  String languageCode = shPref.getString(LANGUAGE_CODE)?? ENGLISH ;
  return _locale(languageCode);
}

