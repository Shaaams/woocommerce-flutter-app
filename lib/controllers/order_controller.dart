import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/contracts/controller.dart';
import 'package:goshopwooapp/models/order.dart';

class OrderController implements Controller{
  ApiInterface orderApi;

  OrderController(this.orderApi);

  @override
  Future<List<Order>> getAll({int page}) async {
    var data = await this.orderApi.getAll();
    List orders = [];
    for(var item in data){
      orders.add(Order.fromJson(item));
    }
    return orders;
  }

  Future<Order> getOrder(int order) async {
    var data = await this.orderApi.gitModel(order);
    return Order.fromJson(data);
  }

}