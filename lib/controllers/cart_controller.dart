import 'package:get/get.dart';
import 'package:shopping/models/cart_item.dart';

class CartController extends GetxController {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get  items  {
    return  {..._items};
  }

  double totalPrice() {
    double total = 0.0;
    _items.forEach((Key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  int itemcount() {
    return _items.length;
  }

  void removeCartItem(int id) {
    _items.remove(id);
    update();
  }

  void clearCartItem() {
    _items.clear();
    update();
  }

  void addCartItem(String id, String title, int quantity, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    update();
  }
}
