import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Screens/OnBoarding/OnBoarding.dart';
import 'package:goshopwooapp/Screens/OnBoarding/on_boarding_functions.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<OnBoarding> onBoardings =[
    OnBoarding(
        image:"assets/images/onboarding1.png",
         title: "Title 1",
         description:'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
    OnBoarding(
        image: "assets/images/onboarding2.png",
        title:"Title 2",
        description:'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
    OnBoarding(
        image: "assets/images/onboarding3.png",
        title:"Title 3",
        description:'The first mate and his Skipper too will do their very comfortable in their tropic island nest to till the end.'),
  ];
  PageController _pageController;

  int _currentPage = 0;
  String _nextTitle = "Next";
  bool langStatus = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,

    );

  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 48),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (BuildContext context, int position){
                  return drawOnBoarding(context, onBoardings[position]);
                },
                onPageChanged: (page){
                  setState(() {
                    _currentPage = page;
//                    if(ui.window.locales.first == ui.window.locales[0]){
//                      _nextTitle = "Next";
//                    }else{
//                      if(ui.window.locales.last == ui.window.locales[2]){
//                        _nextTitle = "التالي";
//                      }
//                    }
//                    ui.window.locales.first == ui.window.locales[0]?_nextTitle = "Next":
//                    _nextTitle = "التالي";
                    _currentPage == onBoardings.length - 1 ?
                    _nextTitle = getTranslated(context, "START_BUTTON" ) :
                    _nextTitle = getTranslated(context, "NEXT_BUTTON" );
//                    if(_currentPage == onBoardings.length - 3){
//                      return _nextTitle = getTranslated(context, "NEXT_BUTTON" );
//                    }else if (_currentPage == onBoardings.length - 2){
//                      return _nextTitle = getTranslated(context, "NEXT_BUTTON" );
//                    }
//                    return _nextTitle = getTranslated(context, "START_BUTTON" );
                  });
                },
                itemCount: this.onBoardings.length,

              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: drawNavigation(context, _pageController, _currentPage, _nextTitle),
            ),
          ],
        ),

      )
    );
  }

  String ggg(BuildContext context, String key){
    return getTranslated(context, key);
  }


}

/**
 *  Widget _drawOnBoarding(BuildContext context, OnBoarding onBoarding) {
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
    child:  Text(
    onBoarding.title,
    style: TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Text(
    onBoarding.description,
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 22,
    letterSpacing: 1.2,
    height: 1.2,
    ),
    ),
    ],
    );
    }

    Widget _drawNavigation(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
    FlatButton(
    child: Text('Skip'),
    onPressed: (){
    _goHomePage(context);
    },
    ),
    Flexible(
    child:_drawDots(context),
    ),

    FlatButton(
    child: Text(_nextTitle),
    onPressed: (){
    if (_currentPage == onBoardings.length -1){
    _goHomePage(context);
    }else{
    _pageController.nextPage(duration: Duration(microseconds: 400), curve: Curves.easeInOut);
    }

    },
    ),
    ],
    );
    }

    void _goHomePage(BuildContext context){
    Navigator.of(context).pushNamed(secondRoute);
    }

    Widget _drawDots(BuildContext context) {
    return Container(
    width: 80,
    height: 10,

    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int position){
    return AnimatedContainer(
    duration: Duration(milliseconds: 400),
    margin: EdgeInsets.only(right: 20),
    width: 10,
    height: 10,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    color: _currentPage == position ? Colors.red : Colors.grey.shade300,
    ),
    );
    },
    itemCount: onBoardings.length,
    ),
    );
    }
 * */