import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goshopwooapp/Screens/Utilities/appbar.dart';
import 'package:goshopwooapp/Screens/Utilities/drawer.dart';
import 'package:goshopwooapp/api/products/products_api.dart';
import 'package:goshopwooapp/controllers/product_controller.dart';
import 'package:goshopwooapp/models/base_product.dart';
import 'package:goshopwooapp/models/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController _productController = ProductController(ProductApi());
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/bg.png',
              fit: BoxFit.cover,)
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: mainAppBar(context, title: 'New App Bar'),
          drawer: mainDrawer(context),
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: _drawHomeScreen(context),
          ),
        ),
      ],
    );
  }

  Widget _drawHomeScreen(BuildContext context) {
    return FutureBuilder(
      future: _productController.getAll(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
        switch(snapshot.connectionState){

          case ConnectionState.waiting:
          case ConnectionState.active:
            return _loadingWidget(context);
            break;
          case ConnectionState.none:
            return _errorWidget(context, msg: "General Error");
            break;
          case ConnectionState.done:
            if(snapshot.hasError){
              return _errorWidget(context, msg: snapshot.error.toString());
            }else if(! snapshot.hasData){
              return _errorWidget(context, msg: "No Data Has Return !! ");
            }
            return _drawElements(context , snapshot.data);
            break;
          default:
            return _errorWidget(context, msg: "General Error");
            break;
        }
      },
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorWidget(BuildContext context, {String msg}) {
    return Center(
      child: Text(msg, style: TextStyle(
        color: Colors.red,
      ),),
    );
  }

  Widget _drawElements(BuildContext context, List<Product> products) {
    List<Product> _randomProducts = [];
    List<int> _randoms = [];
    Random _random = Random();
    for(int i = 0; i < 3 ; i++){
      _randoms.add(_random.nextInt(products.length - 1));
    }
    for (int rand in _randoms){
      _randomProducts.add(products[rand]);
    }
    return ListView(
      children: <Widget>[
        _homeBanner(context, _randomProducts ),
      ],
    );
  }

 Widget _homeBanner(BuildContext context, List<Product> randomProducts) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: PageView.builder(
        itemCount: randomProducts.length,
        itemBuilder: (BuildContext context, int position){
          return Stack(
            children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.cover,
                      image: NetworkImage( randomProducts[position].images[0].src  ),
                  ),
                ),
            ],
          );
        },
      ),
    );
 }
}
