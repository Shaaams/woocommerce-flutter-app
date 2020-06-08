import 'package:flutter/material.dart';
import 'package:goshopwooapp/api/auth/auth_api.dart';
import 'package:goshopwooapp/api/products/categories_api.dart';
import 'package:goshopwooapp/api/products/tag_api.dart';
import 'package:goshopwooapp/controllers/auth_controller.dart';
import 'package:goshopwooapp/controllers/category_controller.dart';
import 'package:goshopwooapp/controllers/tag_controller.dart';
import 'package:goshopwooapp/models/category.dart';
import 'package:goshopwooapp/models/tag.dart';

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

  _testApi() async{
//    List<Tag> tags = await tagController.getAll();
//    for(Tag tag in tags){
//      print(tag.name);
//  }
//      List<Category> categories = await categoryController.getAll();
//      for(Category category in categories){
//        print(category.name);
//      }

    int id = await authController.login({
      'email'    : 'test45@example.com',
      'password' : 'password'
    });

    print(id);

  }
}
