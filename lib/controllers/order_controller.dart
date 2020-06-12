import 'package:goshopwooapp/api/orders/orders_api.dart';
import 'package:goshopwooapp/contracts/controller.dart';
import 'package:goshopwooapp/models/address.dart';
import 'package:goshopwooapp/models/order.dart';
import 'package:goshopwooapp/models/order_item.dart';

class OrderController implements Controller{
  OrderApi orderApi;

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

  Future<bool> createOrder(List<OrderItem> items, {Address billing, Address shipping})async{
    return await this.orderApi.createOrder( items , billing: billing , shipping: shipping );
  }

}

// var data = await this.orderApi.createOrder()