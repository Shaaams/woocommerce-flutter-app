import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Routers/custom_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goshopwooapp/Localization/custom_localization.dart';

class MyHomePage extends StatefulWidget {

  final String homeScreenRoute;


  MyHomePage({this.homeScreenRoute});

  static void setLocale(BuildContext context , Locale locale){
    _MyHomePageState state = context.findAncestorStateOfType<_MyHomePageState>();
    state.setLocale(locale);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Locale _locale;
  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_locale == null){
      return Material(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }else{
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        locale: _locale,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localizationsDelegates: [
          CustomLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        onGenerateRoute: CustomRoute.allRoutes,
        initialRoute: widget.homeScreenRoute,
      );
    }
  }
}