import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/controllers/product_controller.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail(
      this.id, this.imageUrl, this.title, this.Price, this.description);
  final String id;
  final String imageUrl;
  final String title;
  final double Price;
  final String description;
final cartController =Get.put(CartController());
final controller =Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
        ),
          body: Column(
        children: [
          Container(
            child: Image.asset(imageUrl),
          ),
          Container(
            decoration: BoxDecoration(
                          color: Colors.white,

                        borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                    style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                    Text('\$'+Price.toString()),
                  ],
                ),
                
                  
                    Text('Description',style:TextStyle(
                        fontWeight: FontWeight.bold,

                    )),
                  
                
                Text(
                  description
                ),
              
              ],
            ),
          ),
            Expanded(
              child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                         onPressed: () => {
                          cartController.addCartItem(id,
                           title,
                           1,
                           Price)
                        }, child: Text('Add to cart'))),
            )
        ],
      )),
    );
  }
}
