import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:goshopwooapp/Screens/Utilities/appbar.dart';
import 'package:goshopwooapp/Screens/Utilities/drawer.dart';
import 'package:goshopwooapp/Screens/constants.dart';
import 'package:goshopwooapp/api/products/products_api.dart';
import 'package:goshopwooapp/controllers/product_controller.dart';
import 'package:goshopwooapp/models/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController _productController = ProductController(ProductApi());
  bool _isLoading = true;
  PageController _bannerController ;
  ValueNotifier<int> _indexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
   _bannerController = PageController(
     initialPage: 0,
   );
  }
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
        ..._productsList(context, products),
      ],
    );
  }

 Widget _homeBanner(BuildContext context, List<Product> randomProducts) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _bannerController,
            onPageChanged: (index){
              _indexNotifier.value = index;
            },
            itemCount: randomProducts.length,
            itemBuilder: (BuildContext context, int position){
              return Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: randomProducts[position].images.length >  0 ? Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        randomProducts[position].images[0].src,
                      ),
                    ) : Image.asset('assets/images/placeholder0.png'),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Html(
                            data: randomProducts[position].name,
                          ),
                          Html(
                            data:'${ randomProducts[position].description.substring(0, (randomProducts[position].description.length * 0.2).floor())}... ',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text('START FROM'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('k.d ${randomProducts[position].price}'),
                          ),
                          FlatButton(
                              onPressed: (){},
                              child: Text('BUY NOW'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              color: Colors.white,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.5, left: 50),
                    ),
                  ),
                ],
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                  child: _drawDots(context, randomProducts.length)
              ),
          ),
        ],
      ),
    );
 }

  Widget _drawDots(BuildContext context, int count ) {
    return Container(
      width: 60,
      height: 10,

      child: ValueListenableBuilder(
        valueListenable: _indexNotifier,
        builder: (BuildContext context , int index, Widget child){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int position){
              return AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(right: 15),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: index == position ? Colors.white : Colors.grey.shade300,
                ),
              );
            },
            itemCount: count,
          );
        },
      ),
    );
  }

 List<Widget> _productsList(BuildContext context, List<Product> products) {
    return products.map((product){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Card(
                child: Image(
                  fit:product.images.length >0 ? BoxFit.cover : BoxFit.contain,
                  image:product.images.length > 0 ? NetworkImage(product.images[0].src,):
                      ExactAssetImage('assets/images/placeholder0.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.name),
                      Text('k.d ${product.price}'),
                    ],
                  ),
                  FlatButton(
                    color: SProductButton,
                    child: Text('BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
 }
}
