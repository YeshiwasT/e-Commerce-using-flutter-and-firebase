import 'package:get/get.dart';
import 'package:shopping/models/order.dart';
import 'package:shopping/models/cart_item.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];
  List<Order> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartItems, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            products: cartItems,
            datetime: DateTime.now()));
    update();
  }
}
