import 'package:flutter/material.dart';
import 'package:goshopwooapp/Routers/route_name.dart';
import 'package:goshopwooapp/Screens/constants.dart';
import 'package:goshopwooapp/api/auth/auth_api.dart';
import 'package:goshopwooapp/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  bool _isLoading = false;
  bool _hasError = false;
  AuthController _authController = AuthController(AuthApi());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    double _containerTop = MediaQuery.of(context).size.height * 0.35;
    double _logoWidth = MediaQuery.of(context).size.width * 0.3;
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              Container(
                width: _screenWidth,
                height: _screenHeight,
                child: Image.asset(
                  "assets/images/pattern.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: _logoWidth,
                right: _logoWidth,
                top: _containerTop * 0.5 - (_logoWidth / 3.78),
                child: Image.asset(
                  "assets/images/mlogo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: _screenWidth,
            height: _screenHeight,
            margin: EdgeInsets.only(top: _containerTop),
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 48, vertical: 48),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Sign Up Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    ..._formElements(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _formElements(BuildContext context) {
    return [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
      SizedBox(
        height: 16,
      ),
      TextFormField(
        controller: _passController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
      SizedBox(
        height: 16,
      ),

      FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          color: SMainColor,
          child: _isLoading ? CircularProgressIndicator() : Text('Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            if (! _isLoading){
              if (_formKey.currentState.validate()) {
                _submitRegister();
              }
            }
          }),
      Text(_hasError ? _errorMessage : "", style: TextStyle(color: Colors.red),),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(color: SHintLine),
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(registerRoute);
              },
              child: Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ];
  }

  void _submitRegister() async {
    setState(() {
      _isLoading = true;
    });
    await _authController.login({
      'email' : _emailController.text,
      'password'  : _passController.text,
    }).then((response)  {
      setState(() {
        _isLoading = false;
        _hasError = false;
      });
      Navigator.of(context).pushNamed(homePageScreenRoute);
    }).catchError((error){
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = error.toString();
      });
    });
  }
}
