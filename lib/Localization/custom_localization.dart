import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLocalization{
  final Locale locale;

  CustomLocalization(this.locale);

  static CustomLocalization of(BuildContext context){
    return Localizations.of<CustomLocalization>(context, CustomLocalization);
  }

  Map<String, String> _localeValue ;

  Future load() async {
    String fromJsonStringValue = await rootBundle.loadString('lib/Lang/${locale.languageCode}.json');
    Map<String, dynamic> toJsonMap = jsonDecode(fromJsonStringValue);
    _localeValue = toJsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translateValue (String key){
    return _localeValue[key];
  }
  // my delegate
  static const LocalizationsDelegate<CustomLocalization> delegate = _CustomLocalizationDelegate();

}

class _CustomLocalizationDelegate extends LocalizationsDelegate<CustomLocalization>{
  const _CustomLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalization> load(Locale locale) async{
    CustomLocalization customLocalization = CustomLocalization(locale);
    await customLocalization.load();
    return customLocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<CustomLocalization> old) => false;

}