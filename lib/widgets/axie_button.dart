import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AxieButton extends StatelessWidget {
  const AxieButton({
    required this.title,
    this.color = Colors.blue,
    required this.assetDecoration,
    this.onPress,
    Key? key}) : super(key: key);
  final Widget title;
  final Function()? onPress;
  final Color color;
  final String assetDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 45,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          SvgPicture.asset(
            assetDecoration,
            color: Colors.black12,
          ),
          Center(child: title),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: onPress,
              ),
            ),
          )
        ],
      ),
    );
  }
}
