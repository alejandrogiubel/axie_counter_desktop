import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:window_manager/window_manager.dart';

class AxieCloseButton extends StatelessWidget {
  const AxieCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 45,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/axie_button_square.svg',
              color: Colors.black12,
            ),
            const Center(child: Icon(CupertinoIcons.clear)),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => windowManager.hide(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
