import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductPost extends StatefulWidget {
  const ProductPost({Key? key}) : super(key: key);

  @override
  _ProductPostState createState() => _ProductPostState();
}

class _ProductPostState extends State<ProductPost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final imageUrlController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              TextFormField(
                controller: titleController,
                decoration:
                    InputDecoration(hintText: 'Title', labelText: 'Title'),
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(
                    hintText: 'imageUrl', labelText: 'imageUrl'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Description', labelText: 'Description'),
              ),
              TextFormField(
                controller: priceController,
                decoration:
                    InputDecoration(hintText: 'Price', labelText: 'Price'),
              ),
              Expanded(
                child: Align(
                  heightFactor: 2,
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () => {

                        FirebaseFirestore.instance.collection('product').add(

                         {
                          'id': uuid.v4(),
                          'title':titleController.text,
                          'imageUrl':imageUrlController.text,
                          'description':descriptionController.text,
                          'price':priceController.text,
                          'isFavorite':false
                        }),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: Text(titleController.text),
                                );
                             },
                            )
                          },
                      child: Text('Post Item')),
                ),
              )
            ]),
          )),
    );
  }
}
