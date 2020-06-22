import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_lang.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Localization/Util/languages.dart';
import 'package:goshopwooapp/Routers/route_name.dart';
import 'package:goshopwooapp/Screens/OnBoarding/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<OnBoarding> onBoardings =[
  OnBoarding(
      image:"assets/images/onboarding1.png",
      title: "Title 1",
      description: 'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
  OnBoarding(
      image: "assets/images/onboarding2.png",
      title:"Title 2",
      description:'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
  OnBoarding(
      image:"assets/images/onboarding3.png",
      title: "Title 3",
      description:'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
];

LocaleListResolutionCallback localeListResolutionCallback;
Widget drawOnBoarding(BuildContext context, OnBoarding onBoarding) {
  double pad = MediaQuery.of(context).size.width * 0.05;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Image.asset(onBoarding.image),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child:  GestureDetector(
          onTap: (){
            showToDialog(context);
          },
          child: Text(onBoarding.title == "Title 1"
              ?getTranslated(context, "TITLE_ONE")
              :onBoarding.title == "Title 2"
              ? getTranslated(context, "TITLE_TWO")
              :getTranslated(context, "TITLE_THREE"),
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
     Padding(
       padding: EdgeInsets.only(bottom: 0),
       child:  Text(onBoarding.description == "The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end."
                ?getTranslated(context, "DESCRIPTION_ONE")
                :onBoarding.description == "The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end."
                ? getTranslated(context, "DESCRIPTION_TWO")
                :getTranslated(context, "DESCRIPTION_THREE"),
         textAlign: TextAlign.center,
         style: TextStyle(
           fontSize: 22,
           letterSpacing: 1.2,
           height: 1.2,
         ),
       ),
     ),
    ],
  );
}

Widget drawNavigation(BuildContext context, PageController pageController, int currentPage , String nextTitle ) {
  double radius = 15.0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      FlatButton(
        child: Text(getTranslated(context, "SKIP_BUTTON"),),
        onPressed: (){
          goHomePage(context);
        },
      ),
      Flexible(
        child:drawDots( context, currentPage),
      ),

      FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        color: Colors.red,
        child: Text( Localizations.localeOf(context).languageCode == "en"
                    ? currentPage == onBoardings.length -1 ? nextTitle= getTranslated(context, "START_BUTTON"): nextTitle = getTranslated(context, "NEXT_BUTTON")
            : currentPage == onBoardings.length -1 ? nextTitle= getTranslated(context, "START_BUTTON"): nextTitle = getTranslated(context, "NEXT_BUTTON"),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        onPressed: (){
          // currentPage == onBoardings.length -1 ? goHomePage(context) :
          // pageController.nextPage(duration: Duration(microseconds: 400), curve: Curves.easeInOut);
          if (currentPage == onBoardings.length -1){
            goHomePage(context);
           // getTranslated(context, "NEXT_BUTTON");

          }else{
            //getTranslated(context, "START_BUTTON");
            pageController.nextPage(duration: Duration(microseconds: 400), curve: Curves.easeInOut);
           // ui.window.locales.first == ui.window.locales[2] ? print("English"): print("العربية");
           // print("jj");

            //print(ui.window.locales[0]);

          }

        },
      ),
    ],
  );
}

void goHomePage(BuildContext context) async{
  await updateSeen();
  Navigator.of(context).pushNamed(authOptionRoute);
}

Widget drawDots(BuildContext context, int currentPage) {
  return Container(
    width: 80,
    height: 10,

    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int position){
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          margin: EdgeInsets.only(right: 15),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: currentPage == position ? Colors.red : Colors.grey.shade300,
          ),
        );
      },
      itemCount: onBoardings.length,
    ),
  );
}

Future<void> updateSeen() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('seen', true);
}

void showToDialog(BuildContext context) async{
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

String getTitle(BuildContext context , OnBoarding onBoarding ){
  String title;
  for(OnBoarding onBoarding in OnBoarding.onBoardings()){
    if (onBoarding.title == "Title 1"){
      return title = getTranslated(context, "TITLE_ONE");
    }else if (onBoarding.title == "Title 2"){
      return title = getTranslated(context, "TITLE_TWO");
    }else{
      return title =getTranslated(context, "TITLE_THREE");
    }
  }
  return title;

}


