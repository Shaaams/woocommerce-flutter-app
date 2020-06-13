import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_lang.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Localization/Util/languages.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "KEY_TITLE_PAGE")),
      ),
      body: Center(
        child:  MaterialButton(
          onPressed: (){
            _showToDialog(context);
          },
          child: Text(getTranslated(context, "KEY_CHANGE_LANG")),
          textColor: Colors.white,
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _showToDialog(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(getTranslated(context, "KEY_TITLE_BUTTON")),
            content: Text(getTranslated(context, "KEY_TEX_BUTTON")),
            actions: <Widget>[
              RaisedButton(
                  child: Text('اللغة العربية'),
                  onPressed: (){
                    Language lang;
                    getArLang(context, lang);
                  }
              ),
              RaisedButton(
                  child: Text('English'),
                  onPressed: (){
                    Language lang;
                    getEnLang(context, lang);
                  }
              ),
            ],
          );
        }

    );
  }
}
