import 'dart:math';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
        // onSubmitted: (value) =>
        //     BlocProvider.of<AddItemCubit>(context).addItem(value),
      ),
    );
  }
}
