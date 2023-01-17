import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylogin_191/pages/login.dart';

import '../services/firebase_auth_service.dart';
import '../utility/TextfieldWidget.dart';
import '../utility/buttonWidget.dart';
import '../utility/imagewidget.dart';
import '../utility/mytext.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ImageWidget(
            ImageAsset: 'images/signup.png',
            ImageHeight: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: Container(
              width: double.infinity,
              height: 450,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                    MylableText: 'Sign Up',
                    FontSize: 35,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    myController: _emailController,
                    HintText: 'Email ID',
                    PrefixIcon: Icon(
                      Icons.alternate_email_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    myController: _passwordController,
                    HintText: 'Password',
                    PrefixIcon: Icon(
                      Icons.lock_outline_rounded,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    myController: _fullNameController,
                    HintText: 'Full name',
                    PrefixIcon: Icon(
                      Icons.perm_identity_rounded,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MyButton(
                    btnText: 'Sign Up',
                    onPressed: () async {
                      try {
                        await FirebaseAuthService().signup(
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      } on FirebaseException catch (e) {
                        print(e.message);
                      }

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
