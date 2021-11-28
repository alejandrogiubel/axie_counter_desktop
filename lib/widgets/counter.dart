import 'package:axie_counter_desktop/widgets/axie_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  TextStyle textStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold
  );
  int count = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/energy.png',
                height: 50,
              ),
              const SizedBox(width: 10,),
              Text('$count',
                style: const TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AxieButton(
              title: Text('+',
                style: textStyle,
              ),
              assetDecoration: 'assets/axie_button_1.svg',
              onPress: () => setState(() {
                count++;
              })
            ),
            AxieButton(
              title: Text('-',
                style: textStyle,
              ),
              assetDecoration: 'assets/axie_button_2.svg',
              onPress: () => setState(() {
                if(count > 0) {
                  count--;
                }
              }),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AxieButton(
              title: Text('+ 2',
                style: textStyle,
              ),
              assetDecoration: 'assets/axie_button_3.svg',
              onPress: () => setState(() {
                count = count + 2;
              })
            ),
            AxieButton(
              title: const Icon(CupertinoIcons.restart),
              assetDecoration: 'assets/axie_button_4.svg',
              onPress: () => setState(() {
                count = 3;
              })
            ),
          ],
        )
      ],
    );
  }
}
