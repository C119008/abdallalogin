// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylogin_191/utility/imagewidget.dart';

import '../services/firebase_auth_service.dart';
import '../utility/buttonWidget.dart';
import '../utility/mytext.dart';
import 'SignUp.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // image
            ImageWidget(
              ImageAsset: 'images/mylogin.png',
              ImageHeight: 250,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // login lable
                    const MyText(MylableText: 'Login', FontSize: 40),
                    SizedBox(
                      height: 30,
                    ),

                    // input username/password
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email ID',
                          prefixIcon: Icon(Icons.alternate_email_outlined)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixText: 'Forget?',
                        suffixStyle: TextStyle(
                            color: Color.fromARGB(255, 26, 56, 247),
                            fontSize: 18),
                      ),
                    ),

                    // login button
                    SizedBox(
                      height: 30,
                    ),

                    MyButton(
                        btnText: 'Login',
                        onPressed: () async {
                          try {
                            await FirebaseAuthService().login(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                            if (FirebaseAuth.instance.currentUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Home()));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      "Invalid Username or Password, Please register again or make sure that username and password is correct."),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                      child: Text("Register Now"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } on FirebaseException catch (e) {
                            print(e.message);
                          }
                        }),

                    // registor now
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New User Please? ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => SignUp()),
                                ));
                          },
                          child: Text('Registor',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 28, 79, 248),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
