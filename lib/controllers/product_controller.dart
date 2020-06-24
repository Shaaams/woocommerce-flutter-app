import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/contracts/controller.dart';
import 'package:goshopwooapp/models/base_product.dart';
import 'package:goshopwooapp/models/product.dart';
import 'package:goshopwooapp/models/variable_product.dart';
import 'package:goshopwooapp/models/variation.dart';

class ProductController implements Controller {
  ApiInterface productApi;

  ProductController(this.productApi);
  @override
  Future<List<Product>> getAll({int page}) async {
    var data = await this.productApi.getAll(page: page);

    List<Product> products = [];
    for (var item in data) {
      if (item['type'] == 'variable') {
      // products.add(VariableProduct.fromJsonMap(item));
      } else {
        products.add(Product.fromJsonMap(item));
      }
    }
    return products;
  }

  Future<BaseProduct> getProduct( int product) async {
    var data = await this.productApi.gitModel(product);
      return Product.fromJsonMap(data);
  }

  Future<List<Variation>> getVariations( { int product} ) async{
    var data = await this.productApi.getVariations( product );
    List<Variation> variations = [];
    for( var item in data ){
      variations.add( Variation.fromJsonMap(item) );
    }
    return variations;
  }


}