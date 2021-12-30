import 'package:flutter/material.dart';
import 'package:shopping/Forms/signin.dart';
import 'package:get/get.dart';
import 'package:shopping/screens/product_overview_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
            ),
            Center(
              child: Text(
                "LogIn",
                style: TextStyle(fontSize: 26, color: Colors.lightBlue),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          icon: Icon(
                            Icons.person,
                          ),
                          hintText: "yeshiwastikimu@gmail.com")),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText:true,
                    autocorrect:false,
                    enableSuggestions: false,
                      controller: passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          icon: Icon(
                            Icons.lock,
                          ),
                          hintText: "password")),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                    style: ButtonStyle(
                        alignment: AlignmentGeometry.lerp(
                            AlignmentDirectional.topEnd,
                            AlignmentDirectional.topEnd,
                            0)),
                    onPressed: () {},
                    child: Text('Forgot password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.lightBlue)))),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text == 'y' &&
                        passwordController.text == 'y') {
                      Get.to(ProductOverViewScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                  child: Text('Login')),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/google_logo.png',
                      height: 25, width: 25),
                )
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Get.to(SignInScreen());
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(color: Colors.lightBlue),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
