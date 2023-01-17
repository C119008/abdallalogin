import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String HintText;
  final Icon PrefixIcon;
  const MyTextField({
    super.key,
    required this.HintText,
    required this.PrefixIcon,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return TextField(
      decoration: InputDecoration(
        hintText: HintText,
        prefixIcon: PrefixIcon,
      ),
      controller: myController,
    );
  }
}
