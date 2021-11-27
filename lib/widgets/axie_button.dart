import 'package:flutter/material.dart';

class AxieButton extends StatelessWidget {
  const AxieButton({
    required this.title,
    this.onPress,
    Key? key}) : super(key: key);
  final String title;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(title)
    );
  }
}
