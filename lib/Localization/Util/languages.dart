
import 'package:flutter/material.dart';

class Language{
  final int id;
  final String name;
  final String flag;
  final String langCode;

  Language({
    @required this.id,
    @required this.name,
    @required this.flag,
    @required this.langCode
  });

  static List<Language> langList(){
    return <Language> [
    Language(id: 1, name: 'US', flag:'English',langCode: 'en' ),
    Language(id: 2, name: 'EG', flag:'العربية',langCode: 'ar' ),
    ];
  }

}