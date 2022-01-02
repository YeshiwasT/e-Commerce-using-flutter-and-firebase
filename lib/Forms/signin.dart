import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phonNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(20),
            child: ListView(children: [
              Center(
                  child: Text('Sign In',
                      style: TextStyle(color: Colors.lightBlue, fontSize: 24))),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        label: Text('User name',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('Email',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                    TextFormField(
                      controller: phonNumberController,
                      decoration: InputDecoration(
                        label: Text('phone number',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        label: Text('Address',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText:true,
                    autocorrect:false,
                    enableSuggestions: false,
                      decoration: InputDecoration(
                        label: Text('Password',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText:true,
                    autocorrect:false,
                    enableSuggestions: false,
                      decoration: InputDecoration(

                        label: Text(' Confirm Password',
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () =>{
               Get.snackbar( 'welcome' ,
               "You registered successfully",snackPosition: SnackPosition.BOTTOM),
              
                  //you can add registered user to database in your collaction by :
              
                // FirebaseFirestore.instance.collection('your_collection_name_from_firebase').add(
                //   {
                //     'userName':userNameController.text,
                //     'email':emailController.text,
                //     'phoneNumber':phonNumberController.text,
                //     'address':addressController.text,
                //     'password':passwordController.text,
                //     'confirmPassword':confirmPasswordController.text
                //   }
                // )
              }, child: Text('Sign In'))
            ])));
  }
}
