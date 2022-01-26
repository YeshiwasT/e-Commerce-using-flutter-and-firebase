import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:shopping/widgets/cart_items.dart';
import 'package:shopping/controllers/order_controller.dart';

class CartScreen extends StatelessWidget {
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyCart'),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child:  Column(children: [
                       FutureBuilder(builder :(context,AsyncSnapshot<int> streamSnapshot){ 
                         return
                         Expanded(child: CartItem()),
                       Text('Total Price  =  \$' +
                            cartController.totalPrice().toString()),
                        GetBuilder<OrderController>(
                            init: OrderController(),
                            builder: (value) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () => {
                                              orderController.addOrders(
                                                  cartController.items.values
                                                      .toList(),
                                                  cartController.totalPrice()),
                                             Get.snackbar('ordered',
                                                 'You ordered Succesfully!',
                                                 snackPosition:
                                                     SnackPosition.BOTTOM)
                                            },
                                        child: Text("order")),
                                    ElevatedButton(
                                        onPressed: () => {
                                              Get.dialog(
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.5),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Text(
                                                              'Do you want to delete Cart Items?',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none))),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                              onPressed: () => {
                                                                    cartController
                                                                        .clearCartItem(),
                                                                    FirebaseFirestore         //to delete items from firebase firestore
                                                                        .instance
                                                                        .collection(
                                                                            'cartItem')
                                                                        .snapshots()
                                                                        .forEach(
                                                                            (element) {
                                                                      for (QueryDocumentSnapshot snapshot
                                                                          in element
                                                                              .docs) {
                                                                        snapshot
                                                                            .reference
                                                                            .delete();
                                                                      }
                                                                    }),
                                                                    Navigator.pop(
                                                                        context,
                                                                        true)
                                                                  },
                                                              child:
                                                                  Text('yes')),
                                                          ElevatedButton(
                                                              onPressed: () => {
                                                                    Navigator.pop(
                                                                        context,
                                                                        true)
                                                                  },
                                                              child: Text('No'))
                                                        ],
                                                      )
                                                    ]),
                                              )
                                            },
                                        child: Text('Clear All'))
                                  ],
                                ))
                      ]),
    ));
                  }
                  
                 
  }

