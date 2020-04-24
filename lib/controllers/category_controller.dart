import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/api/products/categories_api.dart';
import 'package:goshopwooapp/controllers/controller.dart';
import 'package:goshopwooapp/models/category.dart';

class CategoryController implements Controller{

  ApiInterface categoryApi;

  CategoryController(this.categoryApi);

  @override
  Future<List<dynamic>> getAll({int page}) async{
    var data = await categoryApi.getAll();
    List<Category> categories = [];
    for(var item in data){
      categories.add(Category.fromJsonMap(item));
    }

    return categories;

  }


}