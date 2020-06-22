import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';

class OnBoarding{
  String image, title, description;

  OnBoarding({
    @required this.image,
    @required this.title,
    @required this.description
  });

  static List<OnBoarding> onBoardings(){
    return <OnBoarding> [
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
  }

  String getTitle(BuildContext context, OnBoarding onBoarding){
    String title;
    for(OnBoarding onBoarding in OnBoarding.onBoardings()){
      switch(onBoarding.title){
        case "Title 1":
          title = getTranslated(context, "TITLE_ONE");
          break;
        case "Title 2":
          title = getTranslated(context, "TITLE_TWO");
          break;
        case "Title 3":
          title = getTranslated(context, "TITLE_THREE");
          break;
      }

    return title;
      //    if(onBoarding.title == "title 1"){
//       title = getTranslated(context, "TITLE_ONE");
//    }else if(onBoarding.title == ""){
//
//    }
    }
  }


}