import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: GetBuilder<OrderController>(
          init: orderController,
          builder: (value) {
            return ListView.builder(
                itemCount: orderController.orders.length,
                itemBuilder: (_, index) {
                  return ExpansionTile(
                      title: Text(
                          orderController.orders[index].datetime.toString()),
                      children: [
                        Text("Total Price \$" +
                            orderController.orders[index].amount.toString()),
                              
                        
                        Text(orderController.orders.length.toString()+'  items'),
                      ElevatedButton(onPressed: ()=>{
                        
                      }, child:
                       Text('Delete')),
                        Text('data'),
                      ]);
                });
          },
        ));
  }
}
