import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/models/product.dart';

class ProductController extends GetxController {
  List<Product> _item = [
    // Product(
    //   id: 1,
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 2500.00,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 2,
    //     title: 'Legend',
    //     description:
    //         'Built to last with matte leather uppers, StormKing™ lug rubber outsoles and a flexible elastic goring, the Legend blends form and function like nothing you\'ve seen anywhere else.',
    //     price: 12000.00,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 3,
    //     title: 'The Chelsea',
    //     description: 'Functional and Fashionable.',
    //     price: 49.00,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 4,
    //     title: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 5,
    //     title: 'The Chelsea',
    //     description:
    //         'This hardwearing Chelsea is every bit as comfortable as you\'d expect from a slip-on boot but with the durability of our Rugged & Resilient collection.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 6,
    //     title: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 7,
    //     title: 'The Chelsea',
    //     description:
    //         'Handcrafted for the men who wear their boots hard, every detail was carefully selected so you can go the extra mile with confidence.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 8,
    //     title: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 9,
    //     title: 'The Chelsea',
    //     description: 'Functional and Fashionable.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
    // Product(
    //     id: 10,
    //     title: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:'assets/pc.jpg'),
  ];
  List<Product> get items {
    return [..._item];
  }

  List<Product> get favoriteItems {
    return _item.where((productitem) => productitem.isFavorite).toList();
  }

  void addItem(
      String id, String title, String imageUrl, String description, double price,bool isFavorite) {
  _item.insert(0, Product(
        id: id,
        title: title,
        imageUrl: imageUrl,
        description: description,
        price: price
        ,
        isFavorite:isFavorite))  ;

    update();
  }

  Product findProductById(String id) {
    return _item.firstWhere((element) => element.id == id);
  }

  void toggleFavorite(String id) {
    update();
  }
}
