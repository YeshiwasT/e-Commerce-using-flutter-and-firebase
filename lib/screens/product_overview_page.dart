import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/controllers/product_controller.dart';
import 'package:shopping/widgets/app_drawer.dart';
import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/widgets/product_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final cartController = Get.put(CartController());
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('shemisu shop'),
          actions: <Widget>[
            GetBuilder<CartController>(
                init: CartController(),
                builder: (context) {
                  return Stack(
                    children:[
                      IconButton(
                        onPressed: () {
                          Get.to(CartScreen());
                        },
                        icon: Icon(Icons.shopping_cart)),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Text(cartController.itemcount().toString(),textAlign: TextAlign.center,style:TextStyle(color: Colors.red))),
    
                    ] 
                  );
                }),
          ],
        ),
        drawer: AppDrawer(),
        body: Container(
          margin: EdgeInsets.only(left:10,right: 10),
          child: ProductGrid()),
      ),
    );
  }
}
