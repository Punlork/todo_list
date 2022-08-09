import 'package:flutter/material.dart';

class AddItemScreenButtons extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function onPressed;
  const AddItemScreenButtons({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      icon: icon,
      label: Text(title),
    );
  }
}
