import 'package:flutter/cupertino.dart';
import 'package:test_app/database_helper.dart';
import 'package:test_app/order/data/order.dart';

OrderService orderService = OrderService();

class OrderService extends ChangeNotifier {
  List<Order> orders = [];

  init() async {
    getOrders();
  }

  getOrders() async {
    orders = await db.orderBean.getAll();
    notifyListeners();
  }

  saveOrder(Order order) async {
    await db.orderBean.insert(order);
    getOrders();
  }

  // call api
  Future<bool> getOrdersFromApi() async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }
}
