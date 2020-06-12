import 'package:flutter/material.dart';
import 'package:goshopwooapp/api/auth/auth_api.dart';
import 'package:goshopwooapp/api/orders/orders_api.dart';
import 'package:goshopwooapp/api/payment/cash_on_delivery.dart';
import 'package:goshopwooapp/api/payment/checkout_payment.dart';
import 'package:goshopwooapp/api/payment/payment_controller.dart';
import 'package:goshopwooapp/api/products/categories_api.dart';
import 'package:goshopwooapp/api/products/products_api.dart';
import 'package:goshopwooapp/api/products/tag_api.dart';
import 'package:goshopwooapp/api/profile/profile_api.dart';
import 'package:goshopwooapp/controllers/auth_controller.dart';
import 'package:goshopwooapp/controllers/category_controller.dart';
import 'package:goshopwooapp/controllers/order_controller.dart';
import 'package:goshopwooapp/controllers/product_controller.dart';
import 'package:goshopwooapp/controllers/profile_controller.dart';
import 'package:goshopwooapp/controllers/tag_controller.dart';
import 'package:goshopwooapp/models/address.dart';
import 'package:goshopwooapp/models/attribute.dart';
import 'package:goshopwooapp/models/base_product.dart';
import 'package:goshopwooapp/models/card_info.dart';
import 'package:goshopwooapp/models/category.dart';
import 'package:goshopwooapp/models/customer.dart';
import 'package:goshopwooapp/models/order.dart';
import 'package:goshopwooapp/models/order_item.dart';
import 'package:goshopwooapp/models/payment_response.dart';
import 'package:goshopwooapp/models/product.dart';
import 'package:goshopwooapp/models/profile.dart';
import 'package:goshopwooapp/models/tag.dart';
import 'package:goshopwooapp/models/variable_product.dart';
import 'package:goshopwooapp/models/variation.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  TagController tagController = TagController(TagApi());
  CategoryController categoryController = CategoryController(CategoryApi());
  AuthController authController = AuthController(AuthApi());
  ProfileController profileController = ProfileController(ProfileApi());
  ProductController productController = ProductController(ProductApi());
  OrderController orderController = OrderController(OrderApi());
  PaymentController paymentController = PaymentController(CashOnDelivery());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('my App'),
      ),
      body: Container(
        child: Center(
          child: Text('hi'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _testApi,
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _testApi() async {
  List<OrderItem> items = [
    OrderItem(product_id: 38, quantity: 2, variation_id: null),
    OrderItem(product_id: 37, quantity: 2, variation_id: null),
    OrderItem(product_id: 48, quantity: 2, variation_id: 47),

  ];
  //print(items);
  print(await orderController.createOrder(items));

  }


}