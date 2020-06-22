import 'package:flutter/material.dart';
import 'package:goshopwooapp/Localization/Functionality/get_translated.dart';
import 'package:goshopwooapp/Routers/route_name.dart';

class AuthOption extends StatefulWidget {
  @override
  _AuthOptionState createState() => _AuthOptionState();
}

class _AuthOptionState extends State<AuthOption> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
            width: _screenWidth,
            child: Image.asset(
              "assets/images/bg.png",
              fit: BoxFit.cover,
            ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          color: Colors.blueGrey,
                          child: Text(getTranslated(context, "LOGIN_OPTION"),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.of(context).pushNamed(loginRoute);
                          },
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          color: Colors.blueGrey,
                          child: Text( getTranslated(context, "REGISTER_OPTION"),
                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.of(context).pushNamed(registerRoute);
                          },
                        ),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
