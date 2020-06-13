import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Localization/Util/languages.dart';
import 'package:goshopwooapp/Screens/home_screen.dart';

void getEnLang(BuildContext context , Language lang) async {
  for (Language lang in Language.langList()) {
    Locale _temp;
    if (lang.langCode == ENGLISH) {
      _temp = await setLocale(lang.langCode);
      MyHomePage.setLocale(context, _temp);
    }
  }
}

void getArLang(BuildContext context , Language lang) async {
  for (Language lang in Language.langList()) {
    Locale _temp;
    if (lang.langCode == ARABIC) {
      _temp = await setLocale(lang.langCode);
      MyHomePage.setLocale(context, _temp);
    }
  }
}
