import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:axie_counter_desktop/about.dart';
import 'package:axie_counter_desktop/widgets/axie_theme_switcher.dart';
import 'package:axie_counter_desktop/widgets/axie_timer.dart';
import 'package:axie_counter_desktop/widgets/counter.dart';
import 'package:axie_counter_desktop/widgets/close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Axie Counter'),
          actions: const [
            AxieCloseButton()
          ],
        ),
        body: const Counter(),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const AxieTimer(),
              const Spacer(),
              const AxieThemeSwitcher(),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                },
                splashRadius: 20,
                tooltip: 'Info',
                icon: const Icon(
                  CupertinoIcons.info,
                  color: Colors.grey,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
