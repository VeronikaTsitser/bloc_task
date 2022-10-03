import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
    );
  }
}
